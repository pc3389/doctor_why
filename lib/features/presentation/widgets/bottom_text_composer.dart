import 'package:dbheatlcareproject/core/theme/app_colors.dart';
import 'package:dbheatlcareproject/core/theme/app_svgs.dart';
import 'package:dbheatlcareproject/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildTextComposer({
  required context,
  required TextEditingController textController,
  required FocusNode textFieldFocusNode,
  bool enabled = false,
  required void Function(String) handleUserMessageSubmitted,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    decoration: BoxDecoration(color: AppColors.white),
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: textController,
            focusNode: textFieldFocusNode,
            enabled: enabled,
            onSubmitted: enabled ? handleUserMessageSubmitted : null,
            style: AppTextStyles.regular16(
              context,
            ).copyWith(color: AppColors.slate950),
            decoration: InputDecoration(
              hintText: enabled ? "메시지를 입력하세요..." : "지금은 답변을 입력 할 수 없어요",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: AppColors.slate200,
                  width: 1.0,
                ), // 또는 Colors.transparent
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: AppColors.indigo400,
                  width: 1.0,
                ), // 또는 Colors.transparent
              ),
              enabledBorder: OutlineInputBorder(
                // enabledBorder도 명시적으로 설정
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: AppColors.slate200,
                  width: 1.0,
                ), // 또는 Colors.transparent
              ),
              disabledBorder: OutlineInputBorder(
                // enabledBorder도 명시적으로 설정
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: AppColors.slate200,
                  width: 1.0,
                ), // 또는 Colors.transparent
              ),
              filled: true,
              fillColor: AppColors.slate100,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              hintStyle: AppTextStyles.regular16(
                context,
              ).copyWith(color: AppColors.slate400),
            ),
            textInputAction: TextInputAction.send,
            minLines: 1,
            maxLines: 5,
          ),
        ),
        const SizedBox(width: 8.0),
        enabled
            ? IconButton(
              icon: SvgPicture.asset(AppSvgs.sendEnabledIcon),
              onPressed: () {
                final textToSend = textController.text;
                handleUserMessageSubmitted(textToSend);
              },
            )
            : IconButton(
              icon: SvgPicture.asset(AppSvgs.sendDisabledIcon),
              onPressed: null,
            ),
      ],
    ),
  );
}
