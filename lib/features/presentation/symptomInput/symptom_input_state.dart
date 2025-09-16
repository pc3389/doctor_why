import 'package:dbheatlcareproject/features/presentation/models/question_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/chat_message.dart';

part 'symptom_input_state.freezed.dart'; // Freezed가 생성할 파일

@freezed
class SymptomInputState with _$SymptomInputState {
  const factory SymptomInputState({
    @Default([]) List<ChatMessage> messages,
    @Default(0) int currentQuestionIndex,
    @Default(false) bool isTextInputDisabled,
    @Default(false) bool isNotText,
    @Default([]) List<QuestionOption> currentOptions,
    @Default(-1) int selectedOptionIndex,
    @Default([]) List<String> currentArray,
    @Default(-1) int selectedArrayIndex,
    @Default(false) bool isLoading,
    @Default(false) bool isQuestionLoading,
    @Default(false) bool allQuestionsCompleted,
    @Default({}) Map<int, String> userAnswers, // 질문 인덱스 : 답변
    String? error, // 오류 메시지 (선택 사항)
  }) = _SymptomInputState;
}