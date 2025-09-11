// gpt_analysis_repository.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../datasources/gpt_analysis_datasource.dart';
import '../models/gpt_analysis_response.dart';

part 'gpt_analysis_repository.g.dart';

// Repository 추상 클래스
abstract class GptAnalysisRepository {
  Future<GptAnalysisResponse> fetchGptAnalysis();
}

// 실제 Repository 구현체
class GptAnalysisRepositoryImpl implements GptAnalysisRepository {
  final GptAnalysisDataSource _dataSource;

  // 생성자를 통해 DataSource 주입
  GptAnalysisRepositoryImpl(this._dataSource);

  @override
  Future<GptAnalysisResponse> fetchGptAnalysis() async {
    // DataSource로부터 mock 분석 데이터 가져오기
    return await _dataSource.getMockAnalysis();
  }
}

@riverpod
GptAnalysisRepository gptAnalysisRepository(Ref ref) {
  // gptAnalysisDataSourceProvider를 watch하여 DataSource 인스턴스를 가져옴
  final dataSource = ref.watch(gptAnalysisDataSourceProvider);
  return GptAnalysisRepositoryImpl(dataSource);
}
