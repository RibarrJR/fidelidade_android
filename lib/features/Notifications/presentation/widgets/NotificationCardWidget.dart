import 'package:fidelidade_android/utils/Images.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationCard extends StatelessWidget {
  String title;
  String message;
  String message2;
  Function removeNotification;

  NotificationCard({
    Key? key,
    required this.title,
    required this.message,
    required this.message2,
    required this.removeNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(title),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) { removeNotification(); },
        background: Container(color: Colors.transparent),
        child: Center(
          child: Card(
            margin:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Stack(children: [
                          ClipOval(
                            child: Container(
                              width: 14,
                              height: 14,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.close,
                            size: 14,
                            color: primaryColor,
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(coinImg, width: 45,height: 45,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  message,
                                  style: const TextStyle(
                                    color: purpleColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  message2,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 14,
                  ),
                ],
              ),
            ),
            color: primaryColor,
          ),
        ));
  }
}
