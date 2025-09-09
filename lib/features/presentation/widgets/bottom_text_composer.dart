import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextComposer({
  required context,
  required TextEditingController textController,
  required FocusNode textFieldFocusNode,
  bool enabled = false,
  required void Function(String) handleUserMessageSubmitted,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, -1),
          blurRadius: 1.0,
          color: Colors.grey.withOpacity(0.2),
        ),
      ],
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: textController,
            focusNode: textFieldFocusNode,
            enabled: enabled,
            onSubmitted: enabled ? handleUserMessageSubmitted : null,
            decoration: InputDecoration(
              hintText: enabled ? "메시지를 입력하세요..." : "옵션을 선택해주세요",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: enabled ? Colors.grey[100] : Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
            ),
            textInputAction: TextInputAction.send,
            minLines: 1,
            maxLines: 5,
          ),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          icon: Icon(
            Icons.send,
            color:
                enabled
                    ? Theme.of(context).primaryColor
                    : Colors.grey, // 활성화 시 아이콘 색상
          ),
          onPressed:
              enabled
                  ? () {
                    final textToSend = textController.text;
                    handleUserMessageSubmitted(textToSend);
                  }
                  : null,
        ),
      ],
    ),
  );
}
