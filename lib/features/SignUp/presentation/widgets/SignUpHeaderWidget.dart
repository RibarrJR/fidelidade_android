import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpHeader extends StatelessWidget {
  final String imagePath;
  final int iconColor;
  final void Function()? onTap;
  const SignUpHeader({
    Key? key,
    required this.imagePath,
    required this.iconColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: SvgPicture.asset('assets/images/miniLogo.svg',
                    width: 48, height: 48),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
