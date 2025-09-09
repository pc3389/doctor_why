enum AnswerType {
  textInput, // 사용자가 직접 텍스트 입력
  selectableOptions, // AI가 제시하는 옵션 중 선택
  array,
  button,
}

class QuestionOption {
  final String text; // 버튼에 표시될 텍스트
  final String svg; // 버튼 이미지
  final bool isSelected;

  QuestionOption({
    required this.text,
    required this.svg,
    this.isSelected = false,
  });

  // isSelected 값을 변경하여 새로운 QuestionOption 객체를 반환하는 copyWith 메소드
  QuestionOption copyWith({
    String? text,
    String? svg,
    bool? isSelected, // 변경하려는 isSelected 값을 받음
  }) {
    return QuestionOption(
      text: text ?? this.text,
      svg: svg ?? this.svg,
      isSelected: isSelected ?? this.isSelected, // 새로운 isSelected 값 사용
    );
  }

  QuestionOption toggleSelected() {
    return copyWith(isSelected: !this.isSelected);
  }

  QuestionOption select() {
    return copyWith(isSelected: true);
  }

  QuestionOption deselect() {
    return copyWith(isSelected: false);
  }
}

class QuestionData {
  final String? preQuestionPrompt;
  final int id;
  final String initialAiMessage; // 해당 단계에서 AI가 먼저 보내는 메시지
  final String? hint;
  final AnswerType answerType;
  final List<QuestionOption>? options; // AnswerType.selectableOptions 일 때 사용
  final List<String>? arrayOptions; // AnswerType.array 일 때 사용
  final String? nextQuestionPrompt; // 옵션 선택 후 AI가 추가로 할 말 (선택 사항)
  final bool disableTextInputAfterOption; // 옵션 선택 후 텍스트 입력창 비활성화 여부

  QuestionData({
    this.preQuestionPrompt,
    required this.id,
    required this.initialAiMessage,
    this.hint,
    required this.answerType,
    this.options,
    this.arrayOptions,
    this.nextQuestionPrompt,
    this.disableTextInputAfterOption = true, // 기본값은 옵션 선택 후 입력창 비활성화
  }) : assert(
         answerType == AnswerType.selectableOptions
             ? options != null && options.isNotEmpty
             : true,
         'SelectableOptions type must have options',
       );
}
