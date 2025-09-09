import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart'; // ChatMessage ID 생성을 위해
import '../models/chat_message.dart'; // ChatMessage 모델 경로
import '../models/question_data.dart';
import 'symptom_result_state.dart';

final symptomResultNotifierProvider =
    StateNotifierProvider<SymptomResultNotifier, SymptomResultState>((ref) {
      return SymptomResultNotifier();
    });

class SymptomResultNotifier extends StateNotifier<SymptomResultState> {
  final Uuid _uuid = const Uuid();

  SymptomResultNotifier() : super(const SymptomResultState(isLoading: true)) {
    // Notifier가 생성될 때 초기 메시지를 로드합니다.
    _initializeMessages();
  }

  void _initializeMessages() {
    final initialAiMessages = [
      ChatMessage(
        id: _uuid.v4(),
        text: "더 궁금한 사항이 있으세요?\n자유롭게 질문해주세요!",
        sender: MessageSender.ai,
        answerType: AnswerType.textInput,
      ),
      ChatMessage(
        id: _uuid.v4(),
        text: "답변이 마음에 들지 않다면, 다시 처음부터 질문을 시작해주세요.",
        // 이 텍스트는 버블에 표시됨
        sender: MessageSender.ai,
        answerType: AnswerType.button,
        buttonPayload: {
          // 버튼에 필요한 정보
          'text': '처음부터 다시 시작', // 버튼에 표시될 텍스트
          'action': 'restart_symptom_check', // 버튼 클릭 시 수행할 액션 식별자
        },
      ),
    ];

    state = state.copyWith(messages: initialAiMessages, isLoading: false);
  }

  // 사용자 메시지 처리 (예시)
  void addUserMessage(String text) {
    final userMessage = ChatMessage(
      id: _uuid.v4(),
      text: text,
      sender: MessageSender.user,
      answerType: AnswerType.textInput,
    );
    state = state.copyWith(messages: [...state.messages, userMessage]);
    // TODO: AI 응답 로직 추가
    _generateAiResponse(text);
  }

  // AI 응답 생성 (예시)
  void _generateAiResponse(String userQuery) {
    // 실제 AI 로직 대신 임시 응답
    Future.delayed(const Duration(seconds: 1), () {
      final aiResponse = ChatMessage(
        id: _uuid.v4(),
        text: "AI가 '$userQuery'에 대해 답변합니다.",
        sender: MessageSender.ai,
        answerType: AnswerType.textInput,
      );
      state = state.copyWith(messages: [...state.messages, aiResponse]);
    });
  }

  // "처음부터 다시 시작" 버튼 클릭 처리 (예시)
  void handleRestartSymptomCheck() {
    print("Restarting symptom check...");
    // TODO: 실제 증상 확인 초기화 로직 호출
    // 예: 다른 Notifier의 reset 메소드를 호출하거나, 특정 라우트로 이동
    // 이 Notifier의 상태를 초기화할 수도 있습니다.
    _initializeMessages(); // 또는 다른 초기 상태로 변경
  }

  void handleUserTextMessageSubmitted(String text) {
    // TODO: 실제 사용자 메시지 처리 로직
  }
}
