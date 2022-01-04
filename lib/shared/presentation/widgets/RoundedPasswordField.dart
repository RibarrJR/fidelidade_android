import 'package:flutter/material.dart';
import 'package:fidelidade_android/shared/presentation/widgets/TextFieldContainer.dart';
import 'package:fidelidade_android/utils/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  const RoundedPasswordField({
    Key? key,
    this.hintText = "Senha",
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}
