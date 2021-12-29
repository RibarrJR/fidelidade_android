import 'package:fidelidade_android/constants.dart';
import 'package:flutter/material.dart';

class AppChartButton extends StatelessWidget {
  bool selected;
  String label;
  String name;
  Function onSelect;

  final List<ButtonStyle> _styles = [
    ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      side: MaterialStateProperty.all(const BorderSide(
          width: 2, style: BorderStyle.solid, color: primaryColor)),
    ),
    ButtonStyle(
      backgroundColor: MaterialStateProperty.all(primaryColor),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      elevation: MaterialStateProperty.all(0),
    )
  ];

  AppChartButton(
      {Key? key,
      required this.selected,
      required this.label,
      required this.name,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: selected ? _styles[1] : _styles[0],
        onPressed: () {
          onSelect(name);
        },
        child: Text(
          label,
          style: TextStyle(color: selected ? Colors.white : primaryColor),
        ));
  }
}
