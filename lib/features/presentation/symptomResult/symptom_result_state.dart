import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/chat_message.dart';

part 'symptom_result_state.freezed.dart';

@freezed
class SymptomResultState with _$SymptomResultState {
  const factory SymptomResultState({
    @Default([]) List<ChatMessage> messages,
    @Default(false) isLoading,
  }) = _SymptomInputState;
}
