import 'dart:ui';
import 'package:flutter/material.dart';

double _sigmaX = 5.0; // from 0-10
double _sigmaY = 5.0; // from 0-10
double _opacity = 0.5; // from 0-1.0

class ProfileBackground extends StatelessWidget {
  final Widget child;
  const ProfileBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height / 1.8,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -2,
            right: -2,
            left: -2,
            child: Container(
              height: size.height / 1.8,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://avatars.githubusercontent.com/u/4026715?v=4"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                child: Container(
                  color: Colors.blue.withOpacity(_opacity),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
