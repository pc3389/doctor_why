import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectableOptionChip extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SelectableOptionChip({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: onPressed,
      backgroundColor: Colors.blue[50], // 원하는 색상으로 변경 가능
      labelStyle: TextStyle(color: Theme.of(context).primaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.5)),
      ),
    );
  }
}