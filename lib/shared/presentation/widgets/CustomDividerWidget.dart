import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String text;

  const CustomDivider({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            color: primaryColor,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            height: 30,
          ),
        ),
        Text(
          text,
          style:
              const TextStyle(fontWeight: FontWeight.w800, color: primaryColor),
        ),
        const Expanded(
          child: Divider(
            color: primaryColor,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            height: 30,
          ),
        ),
      ],
    );
  }
}
