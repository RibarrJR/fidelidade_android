import 'dart:math';

import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class AppNavBar extends StatefulWidget {
  final Function onNavChange;

  const AppNavBar({Key? key, required this.onNavChange}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppNavBarState();
  }
}

class _AppNavBarState extends State<AppNavBar> with TickerProviderStateMixin {
  late Animation<double> archHeightAnimation;
  late AnimationController archHeightController;
  late AnimationController tabSliderController;
  late Map<String, Animation<double>?> tabSliderAnimations = {
    "a1": null,
    "a2": null,
    "a3": null,
    "a4": null,
  };

  int index = 0;
  late Function _onNavChange;

  @override
  void initState() {
    _onNavChange = widget.onNavChange;
    super.initState();

    tabSliderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    Map<String, Tween<double>> valuesT = {
      "v1": Tween(begin: 0.10, end: 0.61),
      "v2": Tween(begin: 0.15, end: 0.66),
      "v3": Tween(begin: 0.35, end: 0.86),
      "v4": Tween(begin: 0.40, end: 0.91),
    };

    tabSliderAnimations = {
      'a1': valuesT["v1"]?.animate(tabSliderController)
        ?..addListener(() {
          setState(() {});
        })
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed ||
              status == AnimationStatus.dismissed) {
            archHeightController.forward(from: 0.0);
          }
        }),
      'a2': valuesT["v2"]?.animate(tabSliderController)
        ?..addListener(() {
          setState(() {});
        }),
      'a3': valuesT["v3"]?.animate(tabSliderController)
        ?..addListener(() {
          setState(() {});
        }),
      'a4': valuesT["v4"]?.animate(tabSliderController)
        ?..addListener(() {
          setState(() {});
        }),
    };

    archHeightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    Tween<double> _archHeight = Tween(begin: 0.0, end: 20);
    AnimationStatus prevStatus = AnimationStatus.dismissed;
    int direction = 1;

    archHeightAnimation = _archHeight.animate(archHeightController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (prevStatus == AnimationStatus.reverse &&
            status == AnimationStatus.dismissed) {
          if (direction == 1) {
            tabSliderController.forward(from: 0.0);
            direction = 0;
          } else {
            tabSliderController.reverse(from: 1.0);
            direction = 1;
          }
        }
        prevStatus = status;
      });
    archHeightController.forward(from: 0.0);
  }

  @override
  void dispose() {
    tabSliderController.dispose();
    archHeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 80,
      color: Colors.blue,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(_size.width, _size.height),
            painter: NavBarCustomPainter(
                index: index,
                archRadius: archHeightAnimation.value,
                tabPositions: tabSliderAnimations),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: index == 1
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          index = 0;
                          _onNavChange(index);
                          archHeightController.reverse(from: 1.0);
                        });
                      },
                      icon: const Icon(Icons.home)),
                  index == 0
                      ? const Text(
                          "Home",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : const Text(""),
                ],
              ),
              Container(
                width: _size.width * 0.02,
              ),
              Column(
                mainAxisAlignment: index == 0
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          index = 1;
                          _onNavChange(index);
                          archHeightController.reverse(from: 1.0);
                        });
                      },
                      icon: const Icon(Icons.menu)),
                  index == 1
                      ? const Text(
                          "Menu",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : const Text(""),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavBarCustomPainter extends CustomPainter {
  void drawAtCenter(Path path, Size size, Canvas canvas) {
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 30),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.lineTo(size.width, 0);
  }

  void drawAtLeft(Path path, Size size, Canvas canvas, double archHeight,
      Map<String, Animation<double>?> tabPositions) {
    path.lineTo(size.width * (tabPositions["a1"]?.value ?? 0), 0);
    path.quadraticBezierTo(size.width * (tabPositions["a2"]?.value ?? 0), 0,
        size.width * (tabPositions["a2"]?.value ?? 0), 30);
    path.arcToPoint(Offset(size.width * (tabPositions["a3"]?.value ?? 0), 30),
        radius: Radius.elliptical(20, archHeight), clockwise: false);
    path.quadraticBezierTo(size.width * (tabPositions["a3"]?.value ?? 0), 0,
        size.width * (tabPositions["a4"]?.value ?? 0), 0);
    path.lineTo(size.width, 0);
  }

  void drawAtRight(Path path, Size size, Canvas canvas, double archHeight,
      Map<String, Animation<double>?> tabPositions) {
    path.lineTo(size.width * (tabPositions["a1"]?.value ?? 0), 0);
    path.quadraticBezierTo(size.width * (tabPositions["a2"]?.value ?? 0), 0,
        size.width * (tabPositions["a2"]?.value ?? 0), 30);
    path.arcToPoint(Offset(size.width * (tabPositions["a3"]?.value ?? 0), 30),
        radius: Radius.elliptical(20, archHeight), clockwise: false);
    path.quadraticBezierTo(size.width * (tabPositions["a3"]?.value ?? 0), 0,
        size.width * (tabPositions["a4"]?.value ?? 0), 0);
    path.lineTo(size.width, 0);
  }

  int index;
  double archRadius;
  Map<String, Animation<double>?> tabPositions;

  NavBarCustomPainter(
      {required this.index,
      required this.archRadius,
      required this.tabPositions});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(0, 0);

    switch (index) {
      case 0:
        drawAtLeft(path, size, canvas, archRadius, tabPositions);
        break;
      case 1:
        drawAtRight(path, size, canvas, archRadius, tabPositions);
        break;
      default:
        drawAtLeft(path, size, canvas, archRadius, tabPositions);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
