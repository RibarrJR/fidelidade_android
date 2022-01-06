import 'package:fidelidade_android/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  const LoginBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                backgroundElipsesImg,
                width: size.width * 1,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
