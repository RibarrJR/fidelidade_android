import 'package:flutter/material.dart';
import 'package:fidelidade_android/constants.dart';

class ForgotPassword extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const ForgotPassword({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: GestureDetector(
            onTap: press,
            child: Text(
              "Esqueceu a senha?",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
              textAlign: TextAlign.left,
            ),
          ),
        )
      ],
    );
  }
}
