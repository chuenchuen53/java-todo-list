import 'package:flutter/material.dart';

class StyledTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;
  final bool obscureText;
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool enabled;

  const StyledTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.enabled = true,
  });

  @override
  StyledTextFormFieldState createState() => StyledTextFormFieldState();
}

class StyledTextFormFieldState extends State<StyledTextFormField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: const OutlineInputBorder(),
          ),
          obscureText: widget.obscureText,
          enabled: widget.enabled,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: (value) {
            final errorText = widget.validator(value);
            setState(() {
              _errorText = errorText;
            });
            return errorText;
          },
        ),
        if (_errorText == null) const SizedBox(height: 24)
      ],
    );
  }
}
