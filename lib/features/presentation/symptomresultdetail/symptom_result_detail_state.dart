import 'package:dbheatlcareproject/features/presentation/symptomresultdetail/diseases_prediction.dart';
import 'package:dbheatlcareproject/features/presentation/symptomresultdetail/serverity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'medicine.dart';

part 'symptom_result_detail_state.freezed.dart';

@freezed
class SymptomResultDetailState with _$SymptomResultDetailState {
  const factory SymptomResultDetailState({
    @Default([]) List<DiseasePrediction> diseasePredictionList,
    @Default([]) List<String> whatToDoList,
    @Default([]) List<Medicine> medicineList,
    @Default([]) List<Medicine> foodList,
    @Default('') String analysedText,
    Severity? serverity,
    @Default(false) isLoading,
  }) = _SymptomResultDetailState;
}
