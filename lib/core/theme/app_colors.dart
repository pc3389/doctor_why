import 'package:flutter/material.dart';

// 앱 전체에서 사용될 색상을 정의하는 클래스입니다.
// 실제 색상 값은 디자인 시스템에 맞게 수정해주세요.

class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  static const Color slate50 = Color(0xFFF8FAFC);
  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate300 = Color(0xFFCAD5E2);
  static const Color slate400 = Color(0xFF90A1B9);
  static const Color slate500 = Color(0xFF62748E);
  static const Color slate600 = Color(0xFF45556C);
  static const Color slate700 = Color(0xFF314158);
  static const Color slate800 = Color(0xFF1D293D);
  static const Color slate900 = Color(0xFF0F172B);
  static const Color slate950 = Color(0xFF020618);

  static const Color sky50 = Color(0xFFF0F9FF);
  static const Color sky100 = Color(0xFFDFF2FE);
  static const Color sky200 = Color(0xFFB8E6FE);
  static const Color sky300 = Color(0xFF74D4FF);
  static const Color sky400 = Color(0xFF00BCFF);
  static const Color sky500 = Color(0xFF00A6F4);
  static const Color sky600 = Color(0xFF0084D1);
  static const Color sky700 = Color(0xFF0069A8);
  static const Color sky800 = Color(0xFF00598A);
  static const Color sky900 = Color(0xFF024A70);
  static const Color sky950 = Color(0xFF052F4A);

  static const Color indigo50 = Color(0xFFEEF2FF);
  static const Color indigo100 = Color(0xFFE0E7FF);
  static const Color indigo200 = Color(0xFFC6D2FF);
  static const Color indigo300 = Color(0xFFA3B3FF);
  static const Color indigo400 = Color(0xFF7C86FF);
  static const Color indigo500 = Color(0xFF615FFF);
  static const Color indigo600 = Color(0xFF4F39F6);
  static const Color indigo700 = Color(0xFF4F39F6);
  static const Color indigo800 = Color(0xFF372AAC);
  static const Color indigo900 = Color(0xFF312C85);
  static const Color indigo950 = Color(0xFF1E1A4D);

  static const Color white = Color(0xFFFAFAFA);
  static const Color red500 = Color(0xFFFB2C36);
  static const Color transparent = Color(0x00000000);
  static const Color appBarDark = Color(0xFF0B005D);
  static const Color green400 = Color(0xFF05DF72);
  static const Color yellow300 = Color(0xFFFFDF20);

  static const Color detailBackground = Color(0xFF1B1671);

  static Color transparentAppBarBgColor = Color(
    0xFAFAFAFA,
  ).withValues(alpha: 0.05);
}
