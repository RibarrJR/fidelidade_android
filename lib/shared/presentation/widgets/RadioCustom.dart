import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class RadioCustom extends StatefulWidget {
  const RadioCustom({Key? key}) : super(key: key);
  @override
  State<RadioCustom> createState() => _RadioCustom();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioCustom extends State<RadioCustom> {
  int value = 0;
  // ignore: non_constant_identifier_names
  Widget CustomRadioButton(String text, int index) {
    return OutlineButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (value == index) ? Colors.green : Colors.black,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      borderSide:
          BorderSide(color: (value == index) ? Colors.green : Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomRadioButton("Single", 1),
        CustomRadioButton("Married", 2),
        CustomRadioButton("Other", 3)
      ],
    );
  }
}
