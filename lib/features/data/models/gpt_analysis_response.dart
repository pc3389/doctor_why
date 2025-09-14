import 'dart:convert';

import 'disease_info.dart';

class GptAnalysisResponse {
  final String analysisContent;
  final List<DiseaseInfo> expectedDiseases; // 변경: List<String> -> List<DiseaseInfo>
  final String severity;
  final List<String> relatedDepartments;
  final List<String> lifestyleTips;
  final List<ItemWithReason> recommendedMedications; // 변경: List<String> -> List<ItemWithReason>
  final List<ItemWithReason> recommendedFoods; // 변경: List<String> -> List<ItemWithReason>
  final String? recommendedNextStep; // 추가: nullable String
  final String? precautions; // 추가: nullable String

  GptAnalysisResponse({
    required this.analysisContent,
    required this.expectedDiseases,
    required this.severity,
    required this.relatedDepartments,
    required this.lifestyleTips,
    required this.recommendedMedications,
    required this.recommendedFoods,
    this.recommendedNextStep, // nullable
    this.precautions, // nullable
  });

  factory GptAnalysisResponse.fromJson(Map<String, dynamic> json) {
    // '예상되는 질병' 필드 파싱
    var diseaseListFromJson = json['예상되는 질병'] as List<dynamic>?;
    List<DiseaseInfo> diseasesList = diseaseListFromJson
        ?.map((i) => DiseaseInfo.fromJson(i as Map<String, dynamic>))
        .toList() ??
        [];

    // '추천 의약품 또는 건강기능식품' 필드 파싱
    var medListFromJson = json['추천 의약품 또는 건강기능식품'] as List<dynamic>?;
    List<ItemWithReason> medicationsList = medListFromJson
        ?.map((i) => ItemWithReason.fromJson(i as Map<String, dynamic>))
        .toList() ??
        [];

    // '추천 식품' 필드 파싱
    var foodListFromJson = json['추천 식품'] as List<dynamic>?;
    List<ItemWithReason> foodsList = foodListFromJson
        ?.map((i) => ItemWithReason.fromJson(i as Map<String, dynamic>))
        .toList() ??
        [];

    return GptAnalysisResponse(
      analysisContent: json['분석 내용'] as String? ?? '내용 없음',
      expectedDiseases: diseasesList,
      severity: json['심각도'] as String? ?? '정보 없음',
      relatedDepartments: List<String>.from(json['관련 진료과'] as List<dynamic>? ?? []),
      lifestyleTips: List<String>.from(json['생활 습관 팁 및 주의 사항'] as List<dynamic>? ?? []),
      recommendedMedications: medicationsList,
      recommendedFoods: foodsList,
      recommendedNextStep: json['권장 다음 단계'] as String?, // nullable 처리
      precautions: json['주의사항'] as String?, // nullable 처리
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '분석 내용': analysisContent,
      '예상되는 질병': expectedDiseases.map((i) => i.toJson()).toList(),
      '심각도': severity,
      '관련 진료과': relatedDepartments,
      '생활 습관 팁 및 주의 사항': lifestyleTips,
      '추천 의약품 또는 건강기능식품': recommendedMedications.map((i) => i.toJson()).toList(),
      '추천 식품': recommendedFoods.map((i) => i.toJson()).toList(),
      '권장 다음 단계': recommendedNextStep,
      '주의사항': precautions,
    };
  }
}

// Helper function to parse a single response object
GptAnalysisResponse gptAnalysisResponseFromJson(String str) =>
    GptAnalysisResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String gptAnalysisResponseToJson(GptAnalysisResponse data) =>
    json.encode(data.toJson());
