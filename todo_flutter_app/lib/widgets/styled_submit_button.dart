import 'package:flutter/material.dart';

class StyledSubmitButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool loading;
  final String errorMsg;

  const StyledSubmitButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.loading,
    required this.errorMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: loading ? null : onPressed,
                child: loading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Text(buttonText),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 24,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              errorMsg,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
