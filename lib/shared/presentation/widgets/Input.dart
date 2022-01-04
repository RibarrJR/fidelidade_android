import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final Function(dynamic value)? onChanged;

  const Input({
    Key? key,
    this.controller,
    required this.labelText,
    this.validator,
    this.hintText,
    this.autovalidateMode,
    this.inputFormatters,
    this.obscureText,
    this.readOnly,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();

    return TextFormField(
        keyboardType: keyboardType,
        onChanged: (value) {
          onChanged!(value);
        },
        readOnly: readOnly ?? false,
        obscureText: obscureText ?? false,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: primaryColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                    color: primaryColor, style: BorderStyle.solid, width: 1.7)),
            hintText: hintText,
            labelText: labelText));
  }
}
