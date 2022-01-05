import 'package:fidelidade_android/features/Extract/presentation/pages/ExtractPage.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class ExtractCard extends StatelessWidget {
  late IconData icon;
  final String amount;
  final String date;
  final CardType type;
  late String text;
  ExtractCard({
    Key? key,
    required this.type,
    required this.amount,
    required this.date,
  }) : super(key: key) {
    switch (type) {
      case CardType.RECEIVE:
        icon = Icons.paid;
        text = "Você recebeu: $amount moedas";
        break;
      case CardType.TRANSFER:
        icon = Icons.swap_horizontal_circle;
        text = "Você transferiu: $amount";
        break;
      case CardType.WITHDRAW:
        icon = Icons.outbond;
        text = "Você sacou: $amount";
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      color: disabledBg,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                          color: Color(0xFF232F95),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 0.2),
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      text,
                      style: TextStyle(fontSize: 17, letterSpacing: 0.2),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  icon,
                  color: primaryColor,
                  size: 32,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

