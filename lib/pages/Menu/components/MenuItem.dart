import 'package:flutter/material.dart';

class AppMenuItem extends StatelessWidget {
  final Function pageCall;
  final String pageName;
  final Icon icon;

  const AppMenuItem(
      {Key? key,
      required this.pageCall,
      required this.pageName,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.00),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(pageName), icon],
        ),
        enableFeedback: true,
        enabled: true,
        onTap: () {
          pageCall(pageName.toLowerCase());
        },
        subtitle: const Divider(
          thickness: 2,
          indent: 0,
          endIndent: 2,
          color: Colors.black,
        ),
      ),
    );
  }
}
