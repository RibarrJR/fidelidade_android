import 'package:flutter/material.dart';
import '../../../constants.dart';

class HomeHeader extends StatelessWidget with PreferredSizeWidget {
  final String name;
  final bool hasNotification;
  const HomeHeader({
    required this.name,
    required this.hasNotification,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.account_circle,
                        size: 75,
                        color: Colors.white,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Olá',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white)),
                      Text(name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  const Icon(Icons.notifications,
                      color: Colors.white, size: 40),
                  Positioned(
                      right: 4,
                      top: 4,
                      child: Visibility(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor, width: 2),
                              shape: BoxShape.circle,
                              color: Colors.green),
                        ),
                        visible: hasNotification,
                      ))
                ],
              )
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(125);
}
