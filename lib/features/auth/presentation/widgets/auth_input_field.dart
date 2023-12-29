import 'package:flutter/material.dart';
import 'package:flutter_sway_app/core/constants/constants.dart';

class AuthInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const AuthInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UIConstants.defaultInputBorder,
        focusedBorder: UIConstants.defaultInputBorder,
        hintStyle: const TextStyle(fontSize: 18),
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
    );
  }
}
