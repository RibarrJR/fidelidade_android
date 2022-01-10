// ignore_for_file: unnecessary_const

import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/utils/Images.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:fidelidade_android/features/Notifications/presentation/widgets/NotificationCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        body: items.isNotEmpty
            ? ListView.builder(
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
                      removeNotification: () =>
                          removeNotification(items, index));
                })
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: SvgPicture.asset(
                        fileEmpty,
                        width: 259,
                        height: 324,
                  )),
                  const SizedBox(height: 96),
                  const Text(
                    'Tudo certo, te avisaremos quando houver novas notificações!',
                    textAlign: TextAlign.center,
                    style: TextStyle(                        
                        color: disabledBg,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                  ),
                ],
              ));
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 13.0, top: 45),
          child: Text(
            "28/12/2021",
            style: TextStyle(
                fontWeight: FontWeight.normal, color: primaryColor, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8, 
            bottom: 21,
            left: 16,
            right: 16        
          ),
          child: Container(
            color: primaryColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}
