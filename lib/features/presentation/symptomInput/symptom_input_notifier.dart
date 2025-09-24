import 'package:doctorwhy/features/presentation/models/question_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../core/utils/analytics_service.dart';
import '../models/chat_message.dart';
import '../models/symptom_questions.dart';
import 'symptom_input_state.dart';

// .family를 사용하여 Notifier 생성 시 초기 questionIndex와 initialMessages를 전달
final symptomInputNotifierProvider =
    StateNotifierProvider<SymptomInputNotifier, SymptomInputState>((ref) {
      return SymptomInputNotifier();
    });

class SymptomInputNotifier extends StateNotifier<SymptomInputState> {
  final Uuid _uuid = const Uuid();

  SymptomInputNotifier() : super(SymptomInputState()) {
    // Notifier 생성 시 첫 번째 (또는 지정된) 질문 로드
    loadQuestion();
  }

  void resetSymptomInputSession(int index) {
    state = state.copyWith(
      messages: [],
      currentQuestionIndex: index,
      currentOptions: [],
      selectedOptionIndex: -1,
      currentArray: [],
      selectedArrayIndex: -1,
      isLoading: false,
      allQuestionsCompleted: false,
    );
    loadQuestion();
  }

  void loadQuestion() {
    state = state.copyWith(messages: []);
    final questionIndex = state.currentQuestionIndex;
    if (questionIndex < 0 || state.allQuestionsCompleted) {
      // 이미 모든 질문이 완료되었거나 인덱스가 유효하지 않으면 더 이상 진행하지 않음
      return;
    }

    if (questionIndex >= symptomAnalysisQuestions.length) {
      _handleAllQuestionsCompleted();
      return;
    }
    loadQuestionWithIndex(questionIndex);
  }

  void loadQuestionWithIndex(int questionIndex) {
    final currentQuestion = symptomAnalysisQuestions[questionIndex];
    List<ChatMessage> updatedMessages = List.from(state.messages);

    // // AI의 초기 메시지가 현재 메시지 목록에 없으면 추가
    // bool aiMessageExists = updatedMessages.any(
    //       (msg) =>
    //   msg.sender == MessageSender.ai &&
    //       msg.text == currentQuestion.initialAiMessage,
    // );

    // if (!aiMessageExists) {
    final aiMessage = ChatMessage(
      id: _uuid.v4(),
      text: currentQuestion.initialAiMessage,
      sender: MessageSender.ai,
      hint: currentQuestion.hint,
      answerType: currentQuestion.answerType,
    );
    updatedMessages.add(aiMessage);
    // }

    if (state.allQuestionsCompleted) {
      state = state.copyWith(messages: updatedMessages);
      return;
    }

    state = state.copyWith(
      messages: updatedMessages,
      currentQuestionIndex: questionIndex,
      isTextInputDisabled:
          (currentQuestion.answerType == AnswerType.selectableOptions ||
              currentQuestion.answerType == AnswerType.array) &&
          currentQuestion.disableTextInputAfterOption,
      isNotText:
          currentQuestion.answerType == AnswerType.selectableOptions ||
          currentQuestion.answerType == AnswerType.array,
      currentOptions:
          currentQuestion.answerType == AnswerType.selectableOptions
              ? (currentQuestion.options ?? [])
              : [],
      currentArray:
          currentQuestion.answerType == AnswerType.array
              ? (currentQuestion.arrayOptions ?? [])
              : [],
      isLoading: false,
      allQuestionsCompleted: false,
      // 새로운 질문 로드 시 완료 상태 해제
      error: null,
    );
  }

  void proceedToNextQuestion() {
    resetSymptomInputSession(state.currentQuestionIndex);
    loadQuestion();
  }

  void _addMessageToState(
    String text,
    MessageSender sender,
    AnswerType answerType,
  ) {
    final newMessage = ChatMessage(
      id: _uuid.v4(),
      text: text.trim(),
      sender: sender,
      answerType: answerType,
    );
    state = state.copyWith(messages: [...state.messages, newMessage]);
  }

  void handleUserTextMessageSubmitted(String text) async {
    if (state.isQuestionLoading) return;
    if (text.isEmpty) return;
    state = state.copyWith(isQuestionLoading: true, isTextInputDisabled: true);

    _recordAnswer(state.currentQuestionIndex, text);

    _addMessageToState(text, MessageSender.user, AnswerType.textInput);

    await Future.delayed(Duration(milliseconds: 500));

    state = state.copyWith(isQuestionLoading: false);
    _prepareForNextQuestion();
    proceedToNextQuestion();
  }

  void handleOptionSelected(QuestionOption optionToSelect, int index) async {
    if (state.isQuestionLoading) return;

    state = state.copyWith(selectedOptionIndex: index, isQuestionLoading: true);
    if (index == 0 &&
        state.currentQuestionIndex == 1 &&
        state.isTextInputDisabled == true) {
      final currentQuestion = symptomAnalysisQuestions[1];
      _addMessageToState(
        currentQuestion.additionalQuestion ?? "",
        MessageSender.ai,
        AnswerType.textInput,
      );
      state = state.copyWith(
        isTextInputDisabled: false,
        isNotText: false,
        isLoading: false,
        isQuestionLoading: false,
        allQuestionsCompleted: false,
        error: null,
      );
      return;
    }

    await Future.delayed(Duration(milliseconds: 500));

    _recordAnswer(state.currentQuestionIndex, optionToSelect.text);

    state = state.copyWith(isQuestionLoading: false);

    _prepareForNextQuestion();
    proceedToNextQuestion();
  }

  void handleArraySelected(int index) async {
    if (state.isQuestionLoading) return;
    state = state.copyWith(selectedArrayIndex: index, isQuestionLoading: true);

    _recordAnswer(state.currentQuestionIndex, (index + 1).toString());

    await Future.delayed(Duration(milliseconds: 500));

    state = state.copyWith(isQuestionLoading: false);

    _prepareForNextQuestion();
    proceedToNextQuestion();
  }

  void _recordAnswer(int questionIndex, String answer) {
    final updatedAnswers = Map<int, String>.from(state.userAnswers);
    AnalyticsService.logButtonClick(buttonName: 'input_answer # ${questionIndex+1}');
    updatedAnswers[questionIndex] = answer;
    state = state.copyWith(userAnswers: updatedAnswers);
  }

  void _prepareForNextQuestion() {
    final nextIndex = state.currentQuestionIndex + 1;
    if (nextIndex < symptomAnalysisQuestions.length) {
      state = state.copyWith(currentQuestionIndex: nextIndex);
    } else {
      _handleAllQuestionsCompleted();
    }
  }

  void _handleAllQuestionsCompleted() {
    state = state.copyWith(allQuestionsCompleted: true);
  }
}
