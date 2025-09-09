import 'package:dbheatlcareproject/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';

class ImageWithTextBox extends StatelessWidget {
  final String svgAssetPath; // assets 폴더 내의 SVG 파일 경로
  final String text;
  final bool isSelected;
  final double spaceBetween;
  final Color defaultBorderColor;
  final Color selectedBorderColor;
  final VoidCallback onPressed;
  final Color cardColor; // 카드 배경색

  const ImageWithTextBox({
    super.key,
    required this.svgAssetPath,
    required this.text,
    this.isSelected = false,
    this.spaceBetween = 0.0,
    this.defaultBorderColor = AppColors.indigo100,
    this.selectedBorderColor =
        AppColors.indigo400, // 기본 선택 색상 (테마의 primaryColor 사용 가능)
    this.cardColor = AppColors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color currentBorderColor =
        isSelected ? selectedBorderColor : defaultBorderColor;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0), // 내부 여백
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(8.0), // 고정된 8px radius
          border: Border.all(
            color: currentBorderColor,
            width: isSelected ? 2.0 : 1.0, // 선택 시 테두리 약간 더 두껍게 (선택 사항)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 컨텐츠를 수직 중앙에 배치
          crossAxisAlignment: CrossAxisAlignment.center, // 컨텐츠를 수평 중앙에 배치
          children: <Widget>[
            SvgPicture.asset(svgAssetPath),
            SizedBox(height: spaceBetween), // 이미지와 텍스트 사이 간격
            Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.regular16(context),
              maxLines: 2, // 텍스트가 길 경우 2줄로 제한
            ),
          ],
        ),
      ),
    );
  }
}
