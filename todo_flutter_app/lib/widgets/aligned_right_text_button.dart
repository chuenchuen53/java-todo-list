import 'package:flutter/material.dart';

class AlignedRightTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool disabled;

  const AlignedRightTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: disabled ? null : onPressed,
        child: Text(text),
      ),
    );
  }
}
