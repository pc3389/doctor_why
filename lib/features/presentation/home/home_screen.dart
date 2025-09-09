import 'package:dbheatlcareproject/core/theme/app_svgs.dart';
import 'package:dbheatlcareproject/features/presentation/appbar/custom_app_bar.dart';
import 'package:dbheatlcareproject/features/presentation/widgets/single_button.dart';
import 'package:dbheatlcareproject/features/presentation/home/terms_agreement_dialog.dart';
import 'package:dbheatlcareproject/features/presentation/home/terms_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_text_styles.dart';
import '../symptomInput/symptom_input_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // HomeScreen 자체의 라우트 정보
  static const String routeName = 'home';
  static const String routePath = '/home';
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final termsState = ref.watch(termsNotifierProvider);

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Spacer(flex: 2),
                SvgPicture.asset(AppSvgs.appLogoY),
                const SizedBox(height: 32),
                Text(
                  '증세를 보고 질병을 예측하는 AI',
                  style: AppTextStyles.bold20(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                SvgPicture.asset(AppSvgs.doctorWhyTextBlack),
                Spacer(flex: 3),
                singleButton(
                  context: context,
                  onPressed: () {
                    if (termsState.hasAgreedToTerms) {
                      // 이미 동의한 경우
                      _navigateToSymptomInput(context);
                    } else {
                      // 동의하지 않은 경우, 동의서 팝업 표시
                      showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext dialogContext) {
                          return TermsAgreementDialog(
                            onAgreedAndProceed: () {
                              // 사용자가 다이얼로그에서 '동의합니다'를 누르면
                              // termsNotifierProvider.notifier.agreeToTerms()는
                              // TermsAgreementDialog 내부에서 이미 호출되었습니다.
                              // 여기서는 다음 화면으로 이동만 합니다.
                              _navigateToSymptomInput(context);
                            },
                            onDisagreed: () {
                              // 사용자가 '동의하지 않습니다'를 누른 경우
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('서비스 이용을 위해 약관 동의가 필요합니다.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      );
                    }
                  },
                  text: '질문 시작하기',
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToSymptomInput(BuildContext context) {
    context.push(SymptomInputScreen.routePathWithParams(0));
  }
}
