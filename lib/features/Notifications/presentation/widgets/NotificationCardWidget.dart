import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  String item;
  Function removeNotification;

  NotificationCard({
    Key? key,
    required this.item,
    required this.removeNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(item),
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
                        child: Image.asset('assets/images/coin.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Você ganhou!',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 15,
                            ),
                            Row(
                              children: const [
                                Text(
                                  '300 moedas',
                                  style: TextStyle(color: purpleColor),
                                ),
                                Text(
                                  ' Drograria araujo',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200),
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
