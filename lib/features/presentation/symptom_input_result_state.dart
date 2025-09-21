import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/user_input_request_model.dart';

part 'symptom_input_result_state.freezed.dart';

@freezed
class SymptomInputResultState with _$SymptomInputResultState {
  const factory SymptomInputResultState({
    UserInputRequestModel? userInputRequest,
  }) = _SymptomInputResultState;
}
