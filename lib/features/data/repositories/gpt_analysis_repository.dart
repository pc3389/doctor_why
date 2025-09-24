import 'package:doctorwhy/features/data/models/user_input_request_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../datasources/gpt_analysis_datasource.dart';
import '../models/gpt_analysis_response.dart';

part 'gpt_analysis_repository.g.dart';

// Repository 추상 클래스
abstract class GptAnalysisRepository {
  Future<GptAnalysisResponse> fetchGptAnalysis(
    UserInputRequestModel userInput,
  );
}

// 실제 Repository 구현체
class GptAnalysisRepositoryImpl implements GptAnalysisRepository {
  final GptAnalysisDataSource _dataSource;

  final Map<UserInputRequestModel, GptAnalysisResponse> _inMemoryCache = {};

  // 생성자를 통해 DataSource 주입
  GptAnalysisRepositoryImpl(this._dataSource);

  @override
  Future<GptAnalysisResponse> fetchGptAnalysis(
    UserInputRequestModel userInput,
  ) async {
    try {
      // DataSource로부터 mock 분석 데이터 가져오기
      if (_inMemoryCache.containsKey(userInput)) {
        return _inMemoryCache[userInput]!;
      }

      final response = await _dataSource.getAnalysis(userInput);
      _inMemoryCache[userInput] = response;

      return response;
    } catch (e) {
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
GptAnalysisRepository gptAnalysisRepository(Ref ref) {
  // gptAnalysisDataSourceProvider를 watch하여 DataSource 인스턴스를 가져옴
  final dataSource = ref.watch(gptMockAnalysisDataSourceProvider);
  return GptAnalysisRepositoryImpl(dataSource);
}
