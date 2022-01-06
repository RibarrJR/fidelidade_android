import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class BalanceMoneyCard extends StatelessWidget {
  final Size size;
  final String moneyAmount;
  Function? openModal;
  BalanceMoneyCard(
      {Key? key, required this.size, this.openModal, required this.moneyAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      color: secondaryColor,
      child: Column(
        children: [
          Container(
            width: size.width,
            margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: const Text(
              'Saldo - Carteira',
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
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      'R\$ $moneyAmount,00',
                      style: const TextStyle(
                          color: moneyColor,
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor)),
                        onPressed: () {
                          openModal!(context, false, moneyAmount);
                        },
                        child: const Text('Converter',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))))
              ],
            ),
          )
        ],
      ),
    );
  }
}
