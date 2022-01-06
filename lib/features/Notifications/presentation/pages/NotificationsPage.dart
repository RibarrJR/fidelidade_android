// ignore_for_file: unnecessary_const

import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:fidelidade_android/features/Notifications/presentation/widgets/NotificationCardWidget.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final items = List<String>.generate(6, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    void removeNotification(List items, int index) {
      setState(() {
        items.removeAt(index);
      });
    }

    return Scaffold(
        appBar: CustomAppBar(
          title: "Notificações",
          automaticallyImplyLeading: true,
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              if (index == 0) {
                return Column(
                  children: [
                    const NotificationDate(),
                    NotificationCard(
                      item: item,
                      removeNotification: () =>
                        removeNotification(items, index)),
                  ],
                );
              }

              return NotificationCard(
                  item: item,
                  removeNotification: () => removeNotification(items, index));
            })
        );
  }
}

class NotificationDate extends StatelessWidget {
  const NotificationDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Padding(
          padding: EdgeInsets.only(right: 13.0),
          child: Text(
            "28/12/2021",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: purpleColor, fontSize: 18),
          ),
        ),
        Divider(
          color: purpleColor,
          endIndent: 16.0,
          indent: 16.0,
        ),
      ],
    );
  }
}
