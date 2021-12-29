import 'package:fidelidade_android/components/CustomAppBar.dart';
import 'package:fidelidade_android/constants.dart';
import 'package:fidelidade_android/pages/Withdraw/components/PixCardWidget.dart';
import 'package:fidelidade_android/pages/Withdraw/components/TedCardWidget.dart';
import 'package:flutter/material.dart';

class PixPage extends StatefulWidget {
  const PixPage({Key? key}) : super(key: key);

  @override
  _PixPageState createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Sacar - Pix",
          automaticallyImplyLeading: true,
        ),
        body: ListView(
          children: [
            Container(
              height: 15,
            ),
            const Center(
              child: Text(
                'Selecione a Chave',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    letterSpacing: 2.0),
              ),
            ),
            Container(
              height: 15,
            ),
            PixCardWidget(
                type: 'Chave aleatória ',
                value: "98a7dfia98a7dfia.....kjeiu#f&"),
            PixCardWidget(type: 'CPF', value: "126.***.***-08"),
          ],
        ));
  }
}
