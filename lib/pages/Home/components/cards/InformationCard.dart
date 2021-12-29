import 'package:fidelidade_android/constants.dart';
import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final Size size;
  const InformationCard({Key? key, required this.size}) : super(key: key);

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sistema de Moedas',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor)),
                    onPressed: () {},
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 18),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'No '),
                  TextSpan(
                      text: '+Fidelidade',
                      style: TextStyle(color: moneyColor, fontSize: 18)),
                  TextSpan(
                      text:
                          ', você pode recarregar as moedas para facilitar na hora da compra. Clique nesse card para saber mais.'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
