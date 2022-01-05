import 'package:fidelidade_android/features/Extract/presentation/widgets/ExtractCardWidget.dart';
import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Extrato",
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          ExtractCard(
            date: '01/01/2022',
            amount: 'R\$ 5,00',
            type: CardType.WITHDRAW,
          ),
          ExtractCard(
            date: '01/01/2022',
            amount: 'R\$ 5,00',
            type: CardType.TRANSFER,
          ),
          ExtractCard(
            date: '01/01/2022',
            amount: '500',
            type: CardType.RECEIVE,
          ),
        ],
      ),
    );
  }
}

enum CardType { TRANSFER, WITHDRAW, RECEIVE }
