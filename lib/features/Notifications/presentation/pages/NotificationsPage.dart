// ignore_for_file: unnecessary_const

import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/utils/Images.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:fidelidade_android/features/Notifications/presentation/widgets/NotificationCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final items = List<Object>.generate(
    9,
    (i) => {
      'date': '1${i <= 2 ? 0 : i <= 5 ? 1 : 2}/01/2022',
      'title': 'Você Ganhou!',
      'message': '300 moedas',
      'message2': ' Drogaria Araújo'
    },
  );

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
            ? GroupedListView<dynamic, String>(
                elements: items,
                floatingHeader: true,
                useStickyGroupSeparators: true,
                groupBy: (element) => element['date'],
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) =>
                    item1['message'].compareTo(item2['message']),
                order: GroupedListOrder.ASC,
                groupSeparatorBuilder: (String value) =>
                    NotificationDate(date: value),
                indexedItemBuilder: (c, item, index) {
                  return NotificationCard(
                      title: item['title'],
                      message: item['message'],
                      message2: item['message2'],
                      removeNotification: () =>
                          removeNotification(items, index));
                },
              )
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
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ));
  }
}

class NotificationDate extends StatelessWidget {
  final String date;

  const NotificationDate({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0, top: 25),
            child: Text(
              date,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: primaryColor,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 21, left: 16, right: 16),
            child: Container(
              color: primaryColor,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
