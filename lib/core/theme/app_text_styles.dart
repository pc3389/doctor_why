import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart'; // AppColors를 사용하여 텍스트 색상 지정 가능

// 앱 전체에서 사용될 텍스트 스타일을 정의하는 클래스입니다.
// 폰트 패밀리, 사이즈, 두께 등은 디자인 시스템에 맞게 수정해주세요.

class AppTextStyles {
  AppTextStyles._(); // Private constructor to prevent instantiation

  // 기본 폰트 패밀리 (필요시 pubspec.yaml에 폰트 추가 후 설정)
  static const String _fontFamily = 'Pretendard'; // 예: 'Pretendard', 'NotoSansKR' 등

  static const double _extraSmallFontSize = 12.0;
  static const double _smallFontSize = 14.0;
  static const double _mediumFontSize = 16.0;
  static const double _largeFontSize = 18.0;



  static const TextStyle bold12Kr = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _extraSmallFontSize,
    fontWeight: FontWeight.bold,
    color: AppColors.slate950,
    letterSpacing: _extraSmallFontSize * -0.02,
    height: 1.4,
  );

  static const TextStyle bold14Kr = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _smallFontSize,
    fontWeight: FontWeight.bold,
    color: AppColors.slate950,
    letterSpacing: _smallFontSize * -0.02,
      height: 1.4,
  );

  static const TextStyle bold16Kr = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _mediumFontSize,
    fontWeight: FontWeight.bold,
    color: AppColors.slate950,
    letterSpacing: _mediumFontSize * -0.02,
    height: 1.4,
  );

  static const TextStyle bold20Kr = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _largeFontSize,
    fontWeight: FontWeight.bold,
    color: AppColors.slate950,
    letterSpacing: _largeFontSize * -0.02,
    height: 1.4,
  );

  static const TextStyle regular12Kr = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _extraSmallFontSize,
    color: AppColors.slate950,
    letterSpacing: _extraSmallFontSize * -0.02,
    height: 1.4,
  );

  static const TextStyle regular14Kr = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _smallFontSize,
    color: AppColors.slate950,
    letterSpacing: _smallFontSize * -0.02,
    height: 1.4,
  );

  static const TextStyle regular16Kr = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _mediumFontSize,
    color: AppColors.slate950,
    letterSpacing: _mediumFontSize * -0.02,
    height: 1.4,
  );

  static const TextStyle regular20Kr = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _largeFontSize,
    color: AppColors.slate950,
    letterSpacing: _largeFontSize * -0.02,
    height: 1.4,
  );

  static const TextStyle bold12En = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _extraSmallFontSize,
    fontWeight: FontWeight.bold,
    color: AppColors.slate950,
    height: 1.4,
  );

  static const TextStyle bold14En = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _smallFontSize,
    fontWeight: FontWeight.bold,
    color: AppColors.slate950,
    // letterSpacing: -0.5,
    height: 1.4,
  );

  static const TextStyle bold16En = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _mediumFontSize,
    fontWeight: FontWeight.bold,
    color: AppColors.slate950,
    height: 1.4,
  );

  static const TextStyle bold20En = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _largeFontSize,
    fontWeight: FontWeight.bold,
    color: AppColors.slate950,
    height: 1.4,
  );

  static const TextStyle regular12En = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _extraSmallFontSize,
    color: AppColors.slate950,
    height: 1.4,
  );

  static const TextStyle regular14En = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _smallFontSize,
    color: AppColors.slate950,
    height: 1.4,
  );

  static const TextStyle regular16En = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _mediumFontSize,
    color: AppColors.slate950,
    height: 1.4,
  );

  static const TextStyle regular20En = TextStyle(
    fontFamily: _fontFamily,
    fontSize: _largeFontSize,
    color: AppColors.slate950,
    height: 1.4,
  );

  static TextStyle bold12(BuildContext context) {
    final String langCode = context.locale.languageCode;
    if (langCode == 'ko') {
      return bold12Kr;
    }
    return bold12En;
  }

  static TextStyle bold14(BuildContext context) {
    final String langCode = context.locale.languageCode;
    if (langCode == 'ko') {
      return bold14Kr;
    }
    return bold14En;
  }

  static TextStyle bold16(BuildContext context) {
    final String langCode = context.locale.languageCode;
    if (langCode == 'ko') {
      return bold16Kr;
    }
    return bold16En;
  }

  static TextStyle bold20(BuildContext context) {
    final String langCode = context.locale.languageCode;
    if (langCode == 'ko') {
      return bold20Kr;
    }
    return bold20En;
  }

  static TextStyle regular12(BuildContext context) {
    final String langCode = context.locale.languageCode;
    if (langCode == 'ko') {
      return regular12Kr;
    }
    return regular12En;
  }

  static TextStyle regular14(BuildContext context) {
    final String langCode = context.locale.languageCode;
    if (langCode == 'ko') {
      return regular14Kr;
    }
    return regular14En;
  }

  static TextStyle regular16(BuildContext context) {
    final String langCode = context.locale.languageCode;
    if (langCode == 'ko') {
      return regular16Kr;
    }
    return regular16En;
  }

  static TextStyle regular20(BuildContext context) {
    final String langCode = context.locale.languageCode;
    if (langCode == 'ko') {
      return regular20Kr;
    }
    return regular20En;
  }
}