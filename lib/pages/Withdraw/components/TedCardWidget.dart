import 'package:fidelidade_android/constants.dart';
import 'package:flutter/material.dart';

class TedCardWidget extends StatelessWidget {
  final String bank;
  final String agency;
  final String type;
  final String accountNumber;

  const TedCardWidget(
      {Key? key,
      required this.bank,
      required this.agency,
      required this.type,
      required this.accountNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/withdraw/value");
      },
      child: Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 30.0),
                  child: Icon(
                    Icons.account_balance,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bank,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                    Container(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Agencia: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text(agency,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Container(
                          width: 15,
                        ),
                        Text('Conta: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text(accountNumber,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                    Container(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Text('Tipo: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text(type,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
