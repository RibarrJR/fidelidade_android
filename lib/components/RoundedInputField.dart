import 'package:flutter/material.dart';
import 'package:fidelidade_android/components/TextFieldContainer.dart';
import 'package:fidelidade_android/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.labelText,
    this.hintText = '',
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
            onChanged: (value) {
              onChanged(value);
            },
            decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(color: kPrimaryColor),
                hintText: hintText)));
  }
}
