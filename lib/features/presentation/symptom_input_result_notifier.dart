import 'package:doctorwhy/features/data/models/user_input_request_model.dart';
import 'package:doctorwhy/features/presentation/symptom_input_result_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'symptom_input_result_notifier.g.dart';

@Riverpod(keepAlive: true)
class SymptomInputResultNotifier extends _$SymptomInputResultNotifier {
  @override
  SymptomInputResultState build() {
    return SymptomInputResultState();
  }

  void updateState({
    required String gender,
    required String preExisting,
    required String injuredPart,
    required String symptom,
    required String painLevel,
    required String period,
  }) {
    final request = UserInputRequestModel(
      gender: gender,
      preExisting: preExisting,
      injuredPart: injuredPart,
      symptom: symptom,
      painLevel: painLevel,
      period: period,
    );

    state = state.copyWith(userInputRequest: request);
  }
}
