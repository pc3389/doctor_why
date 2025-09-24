// gpt_analysis_datasource.dart

import 'dart:convert';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:doctorwhy/features/data/models/user_input_request_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/gpt_analysis_response.dart';
import 'mock_data.dart'; // mock 데이터 문자열

part 'gpt_analysis_datasource.g.dart';

abstract class GptAnalysisDataSource {
  Future<GptAnalysisResponse> getAnalysis(
    UserInputRequestModel request,
  );
}

class MockGptAnalysisDataSource implements GptAnalysisDataSource {
  @override
  Future<GptAnalysisResponse> getAnalysis(
    UserInputRequestModel request,
  ) async {
    // Simulate network delay

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

class RemoteGptAnalysisDataSource implements GptAnalysisDataSource {
  final OpenAI _openAI = OpenAI.instance.build(
    token: dotenv.env['OPENAI_API_KEY'],
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    ),
    enableLog: true,
  );

  @override
  Future<GptAnalysisResponse> getAnalysis(
    UserInputRequestModel userInputRequest,
  ) async {
    final apiKey = dotenv.env['OPENAI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('OpenAI API Key가 앱에 등록되지 않았습니다.');
    }

    // messages 파라미터를 List<Map<String, dynamic>> 형태로 구성
    final List<Map<String, dynamic>> messages = [
      {
        "role": "system",
        "content": """
          최근 5년 내 자료들 중에서 신뢰할 수 있는 의료 기관 또는 병원의 칼럼, 뉴스 기사에서 의료진이 언급한 내용을 참고해주세요.
          사용자는 증상 등의 정보를 줄것이고
          분석 내용은 되도록 사용자의 답변이 들어가지 않도록 해주세요
          반드시 올바른 JSON 오브젝트만 출력.
          추가 텍스트(사과문, 설명, 마크다운 코드블럭, 주석)는 절대 포함하지 마라.
          출력은 반드시 아래 JSON 형식을 따라야 한다
          출력 전에 JSON이 유효한지 확인하고 잘린 경우 이어서 출력해라:
          {
            "분석 내용": "String", (핸드폰 화면 16sp 2줄~6줄 정도의 분석, 하나의 string으로)
            "예상되는 질병": [
              {
                "이름": "String",
                "확률": "Int"
              }
            ],
            "심각도": "경미 | 보통 | 심각" (String),
            "관련 진료과": [
              "String" (예상되는 질병일 때 방문해야 하는 진료과)
            ],
            "생활 습관 팁 및 주의 사항": [
              "String"
            ],
            "추천 의약품 또는 건강기능식품": [(약국에서 구할 수 있는 의약품, 최대 3개)
              {
                "이름": "String", 
                "이유": "String"
              }
            ],
            "추천 식품": [(최대 3개)
              {
                "이름": "String", 
                "이유": "String"
              }
            ],
            "권장 다음 단계": "String",
            "주의사항": "String"
          }
        """,
      },
      {
        "role": "user",
        "content": """
        성별:${userInputRequest.gender},
        기저질환:${userInputRequest.preExisting},
        아픈부위:${userInputRequest.injuredPart},
        증상:${userInputRequest.symptom},
        통증강도(1~10):${userInputRequest.painLevel},
        아픈기간:${userInputRequest.period},
        """, // symptom_input_screen에서 조합된 사용자 질문
      },
    ];

    // Chat Completions API 요청 객체 생성
    final request = ChatCompleteText(
      messages: messages, // 수정된 messages 리스트 전달
      maxToken: 2000, // 응답으로 받을 최대 토큰 수 (결과가 잘리지 않도록 충분히 설정)
      // 한글은 영어보다 토큰을 많이 차지할 수 있습니다.
      model: Gpt4oMiniChatModel(),
    );

    try {
      final ChatCTResponse? response = await _openAI!.onChatCompletion(
        request: request,
      );

      if (response != null && response.choices.isNotEmpty) {
        final String? chatResponseString =
            response.choices[0].message?.content.trim();
        if (chatResponseString != null && chatResponseString.isNotEmpty) {
          // ChatGPT 응답이 유효한 JSON인지 확인하고 파싱
          try {
            // 응답 문자열 앞뒤에 있을 수 있는 마크다운 JSON 코드 블록 표시 제거
            String cleanedJsonString = chatResponseString;
            if (cleanedJsonString.startsWith("json")) {
              cleanedJsonString = cleanedJsonString.substring(7);
              if (cleanedJsonString.endsWith(" ")) {
                cleanedJsonString = cleanedJsonString.substring(
                  0,
                  cleanedJsonString.length - 3,
                );
              }
            }
            cleanedJsonString = cleanedJsonString.trim();

            final Map<String, dynamic> jsonResponse =
                json.decode(cleanedJsonString) as Map<String, dynamic>;
            return GptAnalysisResponse.fromJson(jsonResponse);
          } catch (e) {
            throw Exception('Chat GPT의 응답이 JSON 형태가 아닙니다.');
          }
        } else {
          throw Exception('ChatGPT에서 빈 응답을 받았습니다.');
        }
      } else {
        String errorMessage = 'chatGPT에서 올바른 응답을 받지 못하였습니다.';
        throw Exception(errorMessage);
      }
    } on OpenAIAuthError catch (e) {
      throw Exception('OpenAI 인증 실패: ${e}');
    } on OpenAIRateLimitError catch (e) {
      throw Exception('개발자가 돈을 지불해야 합니다. 개발자에게 꼭 연락 바랍니다.: ${e}');
    } on OpenAIServerError catch (e) {
      throw Exception('OpenAI 서버 에러: ${e}');
    }
  }
}

@riverpod
GptAnalysisDataSource gptMockAnalysisDataSource(Ref ref) {
  return RemoteGptAnalysisDataSource(); // 실제 사용하는 DataSource 구현체로 교체
}
