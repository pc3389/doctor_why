import 'package:dbheatlcareproject/core/theme/app_svgs.dart';
import 'package:dbheatlcareproject/features/presentation/symptomInput/symptom_input_notifier.dart';
import 'package:dbheatlcareproject/features/presentation/symptomInput/symptom_input_state.dart';
import 'package:dbheatlcareproject/features/presentation/widgets/image_with_text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../appbar/custom_app_bar.dart';
import '../models/chat_message.dart';
import '../models/question_data.dart';
import '../symptomResult/symptom_result_screen.dart';
import '../widgets/bottom_text_composer.dart';
import '../widgets/chat_message_bubble.dart';

class SymptomInputScreen extends ConsumerStatefulWidget {
  final int currentQuestionIndexFromRoute;
  final List<ChatMessage> initialMessages;

  const SymptomInputScreen({
    super.key,
    required this.currentQuestionIndexFromRoute,
    this.initialMessages = const [],
  });

  static const String routeName = 'symptomInput';
  static const String routePath = '/symptom/input/:questionIndex';

  static String routePathWithParams(int questionIndex) =>
      '/symptom/input/$questionIndex';

  @override
  ConsumerState<SymptomInputScreen> createState() => _SymptomInputScreenState();
}

class _SymptomInputScreenState extends ConsumerState<SymptomInputScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController(); // 스크롤 컨트롤러
  final FocusNode _textFieldFocusNode = FocusNode(); // TextField 포커스 관리

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        print("initState: Resetting symptom input session after frame.");
        ref
            .read(symptomInputNotifierProvider.notifier)
            .resetSymptomInputSession(0);
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  void _scrollToBottomIfNeeded(
    List<ChatMessage>? previousMessages,
    List<ChatMessage> nextMessages,
  ) {
    // 메시지 목록이 실제로 변경되었고, 새 메시지가 추가된 경우에만 스크롤
    if (nextMessages.length > (previousMessages?.length ?? 0)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients && mounted) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  // 사용자가 메시지를 전송했을 때 호출되는 함수
  void _handleUserMessageSubmitted(String text) {
    ref
        .read(symptomInputNotifierProvider.notifier)
        .handleUserTextMessageSubmitted(text);
    _textController.clear();

    _proceedToNextQuestion();
  }

  void _handleOptionSelected(QuestionOption option, int index) {
    ref
        .read(symptomInputNotifierProvider.notifier)
        .handleOptionSelected(option, index);
    _proceedToNextQuestion();
  }

  void _proceedToNextQuestion() {
    ref.read(symptomInputNotifierProvider.notifier).proceedToNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(
      symptomInputNotifierProvider.select(
        (state) => state.allQuestionsCompleted,
      ),
      (previous, next) {
        print('asdkjfhsdkjf: completed, listen');
        // allQuestionsCompleted가 true로 변경되었고, 이전 값은 false였을 때
        if (next == true && (previous == false || previous == null)) {
          print("All questions completed! Navigating to the next screen.");
          print('asdkjfhsdkjf: completed, listen asdf');
          context.replace(SymptomResultScreen.routePath);
        }
      },
    );
    final symptomState = ref.watch(symptomInputNotifierProvider);
    final symptomNotifier = ref.read(symptomInputNotifierProvider.notifier);
    ref.listen<List<ChatMessage>>(
      symptomInputNotifierProvider.select((s) => s.messages),
      _scrollToBottomIfNeeded,
    );
    if (!symptomState.isTextInputDisabled) {
      _textFieldFocusNode.requestFocus();
    }

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0
              ),
              child: SvgPicture.asset(
                AppSvgs.appLogoCircleIcon,
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8.0),
                itemCount: symptomState.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = symptomState.messages[index];
                  if (message.answerType == AnswerType.textInput) {
                    return ChatMessageBubble(message: message);
                  } else if (message.answerType ==
                      AnswerType.selectableOptions) {
                    List<Widget> widgets = [];
                    for (
                      int i = 0;
                      i < symptomState.currentOptions.length;
                      i++
                    ) {
                      QuestionOption option = symptomState.currentOptions[i];
                      Widget item = Expanded(
                        flex: 1,
                        child: ImageWithTextBox(
                          svgAssetPath: option.svg,
                          text: option.text,
                          isSelected: symptomState.selectedOptionIndex == i,
                          onPressed: () => _handleOptionSelected(option, i),
                        ),
                      );
                      widgets.add(item);
                      widgets.add(SizedBox(width: 12));
                    }
                    widgets.remove(widgets.last); // 마지막 위젯 제거 (공백)
                    Widget row = Row(children: widgets);
                    return ChatMessageBubble(message: message, widgets: [row]);
                  } else if (message.answerType == AnswerType.array) {
                    List<Widget> widgets = [];
                    int length = symptomState.currentArray.length;
                    for (int i = 0; i < length; i += 2) {
                      List<Widget> rowItems = [];
                      rowItems.add(Text(symptomState.currentArray[i]));
                      if (i + 1 < length) {
                        rowItems.add(Text(symptomState.currentArray[i + 1]));
                      }
                      widgets.add(Row(children: rowItems));
                      return ChatMessageBubble(
                        message: message,
                        widgets: widgets,
                      );
                    }
                  }
                },
              ),
            ),
            // 텍스트 입력 영역
            buildTextComposer(
              context: context,
              textController: _textController,
              textFieldFocusNode: _textFieldFocusNode,
              enabled: !symptomState.isTextInputDisabled,
              handleUserMessageSubmitted: (text) {
                _handleUserMessageSubmitted(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
