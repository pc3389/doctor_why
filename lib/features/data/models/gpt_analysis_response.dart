// gpt_analysis_response.dart

import 'dart:convert';

class GptAnalysisResponse {
  final String analysisContent;
  final List<String> expectedDiseases;
  final String severity;
  final List<String> relatedDepartments;
  final List<String> lifestyleTips;
  final List<String> recommendedMedications;
  final List<String> recommendedFoods;

  GptAnalysisResponse({
    required this.analysisContent,
    required this.expectedDiseases,
    required this.severity,
    required this.relatedDepartments,
    required this.lifestyleTips,
    required this.recommendedMedications,
    required this.recommendedFoods,
  });

  factory GptAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return GptAnalysisResponse(
      analysisContent: json['분석 내용'] as String? ?? '내용 없음',
      expectedDiseases: List<String>.from(json['예상되는 질병'] as List? ?? []),
      severity: json['심각도'] as String? ?? '정보 없음',
      relatedDepartments: List<String>.from(json['관련 진료과'] as List? ?? []),
      lifestyleTips: List<String>.from(json['생활 습관 팁 및 주의 사항'] as List? ?? []),
      recommendedMedications: List<String>.from(
        json['추천 의약품 또는 건강기능식품'] as List? ?? [],
      ),
      recommendedFoods: List<String>.from(json['추천 식품'] as List? ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '분석 내용': analysisContent,
      '예상되는 질병': expectedDiseases,
      '심각도': severity,
      '관련 진료과': relatedDepartments,
      '생활 습관 팁 및 주의 사항': lifestyleTips,
      '추천 의약품 또는 건강기능식품': recommendedMedications,
      '추천 식품': recommendedFoods,
    };
  }
}

// Helper function to parse a single response object
GptAnalysisResponse gptAnalysisResponseFromJson(String str) =>
    GptAnalysisResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String gptAnalysisResponseToJson(GptAnalysisResponse data) =>
    json.encode(data.toJson());
