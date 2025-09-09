// widgets/terms_agreement_dialog.dart (또는 features/terms/presentation/)
import 'package:dbheatlcareproject/core/theme/app_colors.dart';
import 'package:dbheatlcareproject/features/presentation/widgets/single_button.dart';
import 'package:dbheatlcareproject/features/presentation/home/terms_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_text_styles.dart';

class TermsAgreementDialog extends ConsumerWidget {
  // ConsumerWidget으로 변경
  final VoidCallback onAgreedAndProceed; // 동의 후 다음 단계 진행 콜백
  final VoidCallback? onDisagreed; // 비동의 콜백 (선택 사항)

  const TermsAgreementDialog({
    super.key,
    required this.onAgreedAndProceed,
    this.onDisagreed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetRef 추가
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        '원활한 서비스 이용을 위해 동의해주세요.',
        style: AppTextStyles.bold20(context),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("1. ", style: AppTextStyles.regular16(context)),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      style: AppTextStyles.regular16(context),
                      children: <TextSpan>[
                        const TextSpan(text: '닥터 와이에서 제시하는 답변은 '),
                        TextSpan(
                          text: '의료진의 의견을 대신할 수 없습니다.',
                          style: AppTextStyles.bold16(
                            context,
                          ).copyWith(color: AppColors.indigo500),
                        ),
                        const TextSpan(
                          text:
                              ' 병원을 내원하기 전 또는 자가 치료를 위한 참고 사항으로만 활용하시길 바랍니다. '
                              '닥터 와이는 해당 답변에 대해 책임지지 않으며, 정보 활용에 의한 책임은 질문을 한 당사자에게 있습니다.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("2. ", style: AppTextStyles.regular16(context)),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      style: AppTextStyles.regular16(context),
                      children: <TextSpan>[
                        const TextSpan(text: '주민번호, 전화번호 등 '),
                        TextSpan(
                          text: '개인의 신상을 유추할 수 있는 정보는 입력하지 말아주세요.',
                          style: AppTextStyles.bold16(
                            context,
                          ).copyWith(color: AppColors.indigo500),
                        ),
                        const TextSpan(
                          text:
                              ' 사용자의 입력 실수로 인한 상황에 책임지지 않습니다. '
                              '질병에 관한 정보는 서비스 개발 목적 외에 다른 목적으로 활용되지 않습니다.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowDirection: VerticalDirection.down,
      actions: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            singleButton(
              context: context,
              onPressed: () async {
                Navigator.of(context).pop(); // 다이얼로그 닫기
                // Riverpod Notifier를 통해 약관 동의 상태 업데이트
                await ref.read(termsNotifierProvider.notifier).agreeToTerms();
                onAgreedAndProceed(); // 다음 단계 진행 콜백 실행
              },
              text: '동의합니다',
            ),
            const SizedBox(height: 8),
            singleButton(
              context: context,
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
                onDisagreed?.call();
              },
              text: '아니오, 동의하지 않습니다',
              backgroundColor: AppColors.white,
            ),
          ],
        ),
      ],
    );
  }
}
