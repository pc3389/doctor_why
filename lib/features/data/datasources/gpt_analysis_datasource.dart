// gpt_analysis_datasource.dart

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/gpt_analysis_response.dart';
import 'mock_data.dart'; // mock 데이터 문자열

part 'gpt_analysis_datasource.g.dart';

abstract class GptAnalysisDataSource {
  Future<GptAnalysisResponse> getMockAnalysis();
}

class MockGptAnalysisDataSource implements GptAnalysisDataSource {
  @override
  Future<GptAnalysisResponse> getMockAnalysis() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    final Map<String, dynamic> jsonMap =
        json.decode(mockSingleGptResponseJson) as Map<String, dynamic>;
    return GptAnalysisResponse.fromJson(jsonMap);
  }

  // 만약 여러 개의 mock 응답 중 하나를 랜덤하게 또는 특정 조건으로 선택하고 싶다면,
  // mock_data.dart 에 JSON 배열을 정의하고 아래와 같이 구현할 수 있습니다.
  /*
  Future<GptAnalysisResponse> getRandomMockAnalysisFromList() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final List<dynamic> jsonList = json.decode(mockGptResponsesJsonList) as List<dynamic>; // mockGptResponsesJsonList는 JSON 배열 문자열
    final random = Random();
    final randomIndex = random.nextInt(jsonList.length);
    return GptAnalysisResponse.fromJson(jsonList[randomIndex] as Map<String, dynamic>);
  }
  */
}

@riverpod
GptAnalysisDataSource gptAnalysisDataSource(Ref ref) {
  return MockGptAnalysisDataSource(); // 실제 사용하는 DataSource 구현체로 교체
}