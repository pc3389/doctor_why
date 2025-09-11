import 'package:dbheatlcareproject/features/presentation/symptomresultdetail/symptom_result_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/gpt_analysis_repository.dart';
import 'diseases_prediction.dart';
import 'medicine.dart';

part 'symptom_result_detail_notifier.g.dart';

@riverpod
class SymptomResultDetailNotifier extends _$SymptomResultDetailNotifier {
  @override
  SymptomResultDetailState build() {
    return SymptomResultDetailState();
  }

  Future<void> updateStateWithGptResponse() async {
    // Repository 인스턴스를 가져옵니다.
    final repository = ref.read(gptAnalysisRepositoryProvider);

    try {
      // Repository를 통해 GPT 분석 데이터를 가져옵니다.
      final gptResponse = await repository.fetchGptAnalysis();

      // 가져온 데이터로 상태를 업데이트합니다.
      final newDiseasePredictions =
          gptResponse.expectedDiseases
              .map((name) => DiseasePrediction(name: name, probability: 0))
              .toList();
      final newWhatToDoList = List<String>.from(gptResponse.lifestyleTips);
      final newMedicineList =
          gptResponse.recommendedMedications
              .map((name) => Medicine(name: name, description: ''))
              .toList();
      final newFoodList = List<String>.from(gptResponse.recommendedFoods);

      // SymptomResultDetailState에 gptResponse의 다른 필드도 저장할 수 있습니다.
      // 예: state.copyWith에 analysisContent: gptResponse.analysisContent 추가
      state = state.copyWith(
        analysedText: gptResponse.analysisContent,
        diseasePredictionList: newDiseasePredictions,
        whatToDoList: newWhatToDoList,
        medicineList: newMedicineList,
        foodList: newFoodList,
        // analysisContent: gptResponse.analysisContent, // SymptomResultDetailState에 필드 추가 필요
        // severity: gptResponse.severity, // SymptomResultDetailState에 필드 추가 필요
      );
    } catch (e, stackTrace) {
      // 에러 처리 (예: 로그 출력, 사용자에게 알림, 상태에 에러 정보 반영)
      print('Error fetching or updating with GPT response: $e');
      print(stackTrace);
      // SymptomResultDetailState에 에러 관련 필드가 있다면 업데이트 할 수 있습니다.
      // state = state.copyWith(hasError: true, errorMessage: e.toString());
    }
  }

  // 기존 리스트에 아이템을 추가하는 메소드 예시
  void addDiseasePrediction(DiseasePrediction newPrediction) {
    // 현재 리스트를 복사한 후 새 아이템 추가
    final updatedList = List<DiseasePrediction>.from(
      state.diseasePredictionList,
    )..add(newPrediction);

    // 또는 spread operator 사용 (더 권장)
    // final updatedList = [...state.diseasePredictionList, newPrediction];

    state = state.copyWith(diseasePredictionList: updatedList);
  }

  // 특정 조건에 맞는 아이템을 삭제하는 메소드 예시
  void removeDiseasePrediction(String diseaseName) {
    final updatedList =
        state.diseasePredictionList
            .where((prediction) => prediction.name != diseaseName)
            .toList();
    state = state.copyWith(diseasePredictionList: updatedList);
  }

  // 리스트를 비우는 메소드 예시
  void clearPredictions() {
    state = state.copyWith(diseasePredictionList: []);
  }

  // 기존 리스트에 아이템을 추가하는 메소드 예시
  void addWhatToDo(String newWhatToDo) {
    // 현재 리스트를 복사한 후 새 아이템 추가
    final updatedList = List<String>.from(state.whatToDoList)..add(newWhatToDo);

    // 또는 spread operator 사용 (더 권장)
    // final updatedList = [...state.diseasePredictionList, newPrediction];

    state = state.copyWith(whatToDoList: updatedList);
  }

  // 특정 조건에 맞는 아이템을 삭제하는 메소드 예시
  void removeWhatToDo(String text) {
    final updatedList = state.whatToDoList.where((it) => it != text).toList();
    state = state.copyWith(whatToDoList: updatedList);
  }

  // 리스트를 비우는 메소드 예시
  void clearWhatToDo() {
    state = state.copyWith(whatToDoList: []);
  }

  // 기존 리스트에 아이템을 추가하는 메소드 예시
  void addMedicine(Medicine newMedicine) {
    // 현재 리스트를 복사한 후 새 아이템 추가
    final updatedList = List<Medicine>.from(state.medicineList)
      ..add(newMedicine);

    // 또는 spread operator 사용 (더 권장)
    // final updatedList = [...state.diseasePredictionList, newPrediction];

    state = state.copyWith(medicineList: updatedList);
  }

  // 특정 조건에 맞는 아이템을 삭제하는 메소드 예시
  void removeMedicine(String text) {
    final updatedList = state.medicineList.where((it) => it != text).toList();
    state = state.copyWith(medicineList: updatedList);
  }

  // 리스트를 비우는 메소드 예시
  void clearMedicineList() {
    state = state.copyWith(medicineList: []);
  }

  // 기존 리스트에 아이템을 추가하는 메소드 예시
  void addFood(String newFood) {
    // 현재 리스트를 복사한 후 새 아이템 추가
    final updatedList = List<String>.from(state.foodList)..add(newFood);

    // 또는 spread operator 사용 (더 권장)
    // final updatedList = [...state.diseasePredictionList, newPrediction];

    state = state.copyWith(foodList: updatedList);
  }

  // 특정 조건에 맞는 아이템을 삭제하는 메소드 예시
  void removeFood(String text) {
    final updatedList = state.foodList.where((it) => it != text).toList();
    state = state.copyWith(foodList: updatedList);
  }

  // 리스트를 비우는 메소드 예시
  void clearFood() {
    state = state.copyWith(foodList: []);
  }
}
