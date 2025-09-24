import 'package:doctorwhy/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

Widget singleButton({
  required BuildContext context,
  required VoidCallback? onPressed,
  required String text,
  Color backgroundColor = AppColors.indigo500,
  Color textColor = AppColors.white,
  Color borderColor = AppColors.indigo500,
  double width = double.infinity,
  double horizontalPadding = 16.0,
  double verticalPadding = 12.0,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      side: BorderSide(color: borderColor, width: 1.0),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      elevation: 0.0
    ),
    onPressed: onPressed,
    child: SizedBox(
      width: width,
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: AppTextStyles.bold16(context).copyWith(color: textColor),
      ),
    ),
  );
}
