import 'package:dbheatlcareproject/core/theme/app_svgs.dart';
import 'package:dbheatlcareproject/features/presentation/models/question_data.dart';

final List<QuestionData> symptomAnalysisQuestions = [
  QuestionData(
    preQuestionPrompt: '안녕하세요, 닥터 와이입니다. 질환 검색에 대한 모든 것들을 입력해보세요.',
    id: 0,
    initialAiMessage: "성별이 어떻게 되세요?",
    answerType: AnswerType.selectableOptions,
    options: [
      QuestionOption(text: "남자", svg: AppSvgs.maleIcon),
      QuestionOption(text: "여자", svg: AppSvgs.femaleIcon),
    ],
  ),
  QuestionData(
    id: 1,
    initialAiMessage: "기저 질환이 있으세요?",
    answerType: AnswerType.selectableOptions,
    options: [
      QuestionOption(text: "네", svg: AppSvgs.yesIcon),
      QuestionOption(text: "아니오", svg: AppSvgs.noIcon),
    ],
    additionalQuestion: "기저 질환명을 입력해주세요.",
  ),
  QuestionData(
    id: 2,
    initialAiMessage: "어떤 신체 부위가 아프세요?",
    hint: '예시 : 머리, 귀, 팔, 피부',
    answerType: AnswerType.textInput,
  ),
  QuestionData(
    id: 3,
    initialAiMessage: "어떤 증상이 있나요?",
    hint: '예시 : 지끈지끈하다, 이명이 들린다',
    answerType: AnswerType.textInput,
  ),
  QuestionData(
    id: 4,
    initialAiMessage: "0부터 10까지 통증의 정도를 표현하면 어느 정도 인가요?",
    hint: '1 : 통증이 없다. / 10 : 통증이 심하다.',
    arrayOptions: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
    answerType: AnswerType.array,
  ),
  QuestionData(
    id: 5,
    initialAiMessage: "통증 또는 증상이 얼마나 되었나요?",
    hint: '하루, 3일 등 지속된 기간을 적어주세요.',
    answerType: AnswerType.textInput,
  ),
];
