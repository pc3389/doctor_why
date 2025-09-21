import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_input_request_model.freezed.dart';

@freezed
class UserInputRequestModel with _$UserInputRequestModel {
  const factory UserInputRequestModel({
    required String gender,
    required String preExisting,
    required String injuredPart,
    required String symptom,
    required String painLevel,
    required String period,
  }) = _UserInputRequestModel;
}
