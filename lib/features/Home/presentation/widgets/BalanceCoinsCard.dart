import 'package:fidelidade_android/utils/Images.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BalanceCoinsCard extends StatelessWidget {
  final Size size;
  final String coinAmount;
  Function? openModal;
  BalanceCoinsCard(
      {Key? key, required this.size, required this.coinAmount, this.openModal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      color: primaryColor,
      child: Column(
        children: [
          Container(
            width: size.width,
            margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: const Text(
              'Saldo - Moedas',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        coinImg,
                        width: 45,
                        height: 45,
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Text(
                          coinAmount,
                          style: TextStyle(
                            fontSize: 40,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = moneyColor,
                          ),
                        ),
                        Text(
                          coinAmount,
                          style: const TextStyle(
                            fontSize: 40,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () {
                          openModal!(context);
                        },
                        child: const Text('Trocar',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))))
              ],
            ),
          )
        ],
      ),
    );
  }
}
