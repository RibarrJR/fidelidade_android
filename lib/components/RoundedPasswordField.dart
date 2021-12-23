import 'package:flutter/material.dart';
import 'package:fidelidade_android/components/TextFieldContainer.dart';
import 'package:fidelidade_android/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: "Senha",
          labelStyle: TextStyle(color: kPrimaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
