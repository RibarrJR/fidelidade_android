import 'package:flutter/material.dart';
import 'package:fidelidade_android/components/TextFieldContainer.dart';
import 'package:fidelidade_android/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
            decoration: InputDecoration(
      labelText: hintText,
      labelStyle: TextStyle(color: kPrimaryColor),
    )));
  }
}
