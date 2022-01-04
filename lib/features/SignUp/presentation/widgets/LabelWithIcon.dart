import 'package:flutter/material.dart';

class LabelWithIcon extends StatelessWidget {
  final String label;
  final void Function() onTap;
  const LabelWithIcon({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Color(0xff161E64),
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.arrow_forward,
              color: Color(0xff161E64),
              size: 26,
            ),
          )
        ],
      ),
    );
  }
}