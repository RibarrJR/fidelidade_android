import 'package:flutter/material.dart';

class LabelWithIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onTap;
  const LabelWithIcon({Key? key, required this.label, required this.onTap, required this.icon})
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
              icon,
              color: Color(0xff161E64),
              size: 26,
            ),
          )
        ],
      ),
    );
  }
}