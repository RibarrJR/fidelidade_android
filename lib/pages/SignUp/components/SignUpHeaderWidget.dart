import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  final String imagePath;
  final int iconColor;
  final void Function()? onTap;
  const SignUpHeader({
    Key? key,
    required this.imagePath, required this.iconColor, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image(
        image: AssetImage(imagePath),
        fit: BoxFit.fill,
        width: double.infinity,
        height: 200,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_back,
                color: Color(iconColor),
              ),
            ),
          ),
          Image.asset('images/miniLogo.png'),
        ],
      ),
    ]);
  }
}
