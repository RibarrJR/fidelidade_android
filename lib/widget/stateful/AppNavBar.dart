import 'package:fidelidade_android/constants.dart';
import 'package:flutter/material.dart';

class AppNavBar extends StatefulWidget {
  final Function onNavChange;

  const AppNavBar({Key? key, required this.onNavChange}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppNavBarState();
  }
}

class _AppNavBarState extends State<AppNavBar> {
  int index = 0;
  late Function _onNavChange;

  @override
  void initState() {
    _onNavChange = widget.onNavChange;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 80,
      color: Colors.blue ,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(_size.width, _size.height),
            painter: NavBarCustomPainter(index),
          ),
          SizedBox(
            width: _size.width,
            height: 80,
            child: Row(
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

  void drawAtLeft(Path path, Size size, Canvas canvas) {
    path.lineTo(size.width * 0.10, 0);
    path.quadraticBezierTo(size.width * 0.15, 0, size.width * 0.15, 30);
    path.arcToPoint(Offset(size.width * 0.35, 30),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.35, 0, size.width * 0.40, 0);
    path.lineTo(size.width, 0);
  }

  void drawAtRight(Path path, Size size, Canvas canvas) {
    path.lineTo(size.width * 0.61, 0);
    path.quadraticBezierTo(size.width * 0.66, 0, size.width * 0.66, 30);
    path.arcToPoint(Offset(size.width * 0.86, 30),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.86, 0, size.width * 0.91, 0);
    path.lineTo(size.width, 0);
  }

  int index;

  NavBarCustomPainter(this.index);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(0, 0);

    switch (index) {
      case 0:
        drawAtLeft(path, size, canvas);
        break;
      case 1:
        drawAtRight(path, size, canvas);
        break;
      default:
        drawAtLeft(path, size, canvas);
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
    return false;
  }
}
