import 'package:flutter/material.dart';

class InputGroupWithButton extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;
  final bool isLoading;
  final String hintText;
  final String buttonText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const InputGroupWithButton({
    super.key,
    required this.controller,
    required this.onSubmit,
    this.isLoading = false,
    this.hintText = 'Enter text',
    this.buttonText = 'Submit',
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
  });

  @override
  InputGroupWithButtonState createState() => InputGroupWithButtonState();
}

class InputGroupWithButtonState extends State<InputGroupWithButton> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (!widget.isLoading) {
      widget.onSubmit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _isFocused ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              onSubmitted: (_) => _handleSubmit(),
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: FilledButton(
              onPressed: widget.isLoading ? null : _handleSubmit,
              style: FilledButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3),
                    bottomRight: Radius.circular(3),
                  ),
                ),
              ),
              child: Text(widget.buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
