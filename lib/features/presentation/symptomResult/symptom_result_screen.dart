import 'package:dbheatlcareproject/core/theme/app_colors.dart';
import 'package:dbheatlcareproject/core/theme/app_svgs.dart';
import 'package:dbheatlcareproject/core/theme/app_text_styles.dart';
import 'package:dbheatlcareproject/features/presentation/home/home_screen.dart';
import 'package:dbheatlcareproject/features/presentation/symptomResult/symptom_result_notifier.dart';
import 'package:dbheatlcareproject/features/presentation/symptomresultdetail/symptom_result_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../appbar/custom_app_bar.dart';
import '../models/question_data.dart';
import '../widgets/bottom_text_composer.dart';
import '../widgets/chat_message_bubble.dart';
import '../widgets/single_button.dart';

class SymptomResultScreen extends ConsumerStatefulWidget {
  const SymptomResultScreen({super.key});

  static const String routeName = 'symptomResult';
  static const String routePath = '/symptom/result';

  @override
  ConsumerState<SymptomResultScreen> createState() =>
      _SymptomResultScreenState();
}

class _SymptomResultScreenState extends ConsumerState<SymptomResultScreen> {
  final ScrollController _scrollController = ScrollController(); // 스크롤 컨트롤러 추가
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode(); // TextField 포커스 관리

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultState = ref.watch(symptomResultNotifierProvider);
    final resultNotifier = ref.read(symptomResultNotifierProvider.notifier);
    final today = DateTime.now();

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppSvgs.appLogoCircleIcon),

                        SizedBox(height: 16.0),

                        // Card Container
                        Container(
                          height: 462.0,
                          padding: const EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: const DecorationImage(
                              image: AssetImage(AppSvgs.resultCardBg),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              // 위에 텍스트
                              SizedBox(
                                height: 240.0,
                                child: Column(
                                  children: [
                                    Spacer(flex: 1),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 4.0,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              color: AppColors.indigo800,
                                            ),
                                            child: Text(
                                              '${today.year}.${today.month}.${today.day}',
                                              style: AppTextStyles.bold16(
                                                context,
                                              ).copyWith(
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15.0),
                                          SvgPicture.asset(
                                            AppSvgs.resultCardContentText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Spacer(),
                              // 버튼
                              singleButton(
                                context: context,
                                onPressed: () {
                                  context.push(
                                    SymptomResultDetailScreen.routePath,
                                  );
                                },
                                backgroundColor: AppColors.white,
                                textColor: AppColors.slate500,
                                borderColor: AppColors.indigo100,
                                text: '결과 확인하기',
                              ),
                              // Column 내부에 들어갈 위젯들
                            ],
                          ),
                        ),

                        SizedBox(height: 28.0),

                        SvgPicture.asset(AppSvgs.appLogoCircleIcon),
                        const SizedBox(height: 8.0), // 채팅 메시지 목록 전 간격
                        // 로딩 인디케이터 (선택적)
                        if (resultState.isLoading &&
                            resultState.messages.isEmpty)
                          const Center(child: CircularProgressIndicator()),

                        // 채팅 메시지 목록
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: resultState.messages.length,
                          itemBuilder: (context, index) {
                            final message = resultState.messages[index];

                            if (message.answerType == AnswerType.button) {
                              // 버튼 타입 메시지 렌더링
                              // 버튼 위젯을 생성하여 ChatMessageBubble의 widgets 리스트에 전달
                              final buttonWidget = Padding(
                                // 버튼 위아래 간격 추가
                                padding: const EdgeInsets.only(top: 8.0),
                                child: singleButton(
                                  context: context,
                                  onPressed: () {
                                    // 버튼 액션 처리
                                    if (message.buttonPayload is Map &&
                                        message.buttonPayload['action'] ==
                                            'restart_symptom_check') {
                                      context.go(HomeScreen.routePath);
                                    }
                                    // 다른 버튼 액션들도 여기에 추가 가능
                                  },
                                  text:
                                      (message.buttonPayload is Map &&
                                              message.buttonPayload['text'] !=
                                                  null)
                                          ? message.buttonPayload['text']
                                          : "액션 버튼",
                                  backgroundColor: AppColors.white,
                                  textColor: AppColors.indigo500,
                                  borderColor: AppColors.indigo500,
                                ),
                              );
                              return ChatMessageBubble(
                                message: message,
                                widgets: [buttonWidget], // 생성한 버튼 위젯을 리스트로 전달
                              );
                            }
                            // 일반 텍스트 메시지 (widgets가 비어있음)
                            return ChatMessageBubble(message: message);
                          },
                        ),
                        const SizedBox(height: 80), // 입력창에 가려지지 않도록 하단 여백
                      ],
                    ),
                  ),
                ),
              ),
              buildTextComposer(
                context: context,
                textController: _textController,
                textFieldFocusNode: _textFieldFocusNode,
                handleUserMessageSubmitted: (text) {
                  _handleUserMessageSubmitted(text);
                },
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }

  void _handleUserMessageSubmitted(String text) {
    ref
        .read(symptomResultNotifierProvider.notifier)
        .handleUserTextMessageSubmitted(text);
    _textController.clear();
  }
}
