import 'package:doctorwhy/core/theme/app_colors.dart';
import 'package:doctorwhy/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../models/chat_message.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessage message;
  final List<Widget> widgets;
  final bool isUserMessage; // 사용자의 메시지인지 여부

  ChatMessageBubble({super.key, required this.message, this.widgets = const []})
    : isUserMessage = (message.sender == MessageSender.user);

  @override
  Widget build(BuildContext context) {
    // 메시지 정렬 및 배경색 설정
    final alignment =
        isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bubbleColor =
        isUserMessage ? AppColors.indigo500 : AppColors.indigo50;
    final textColor = isUserMessage ? AppColors.white : AppColors.slate950;
    final borderRadius =
        isUserMessage
            ? const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
              topRight: Radius.circular(4), // 뾰족한 느낌
            )
            : const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              topLeft: Radius.circular(4), // 뾰족한 느낌
            );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: <Widget>[
          if (message.text != null)
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75, // 말풍선 최대 너비
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: borderRadius,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text!,
                    style: AppTextStyles.bold16(
                      context,
                    ).copyWith(color: textColor),
                  ),
                  if (message.hint != null)
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text(
                        message.hint!,
                        style: AppTextStyles.regular14(
                          context,
                        ).copyWith(color: AppColors.slate500),
                      ),
                    ),
                  if (widgets.isNotEmpty) ...widgets,
                ],
              ),
            ),
        ],
      ),
    );
  }
}
