import 'package:fidelidade_android/components/RoundedButton.dart';
import 'package:fidelidade_android/constants.dart';
import 'package:fidelidade_android/pages/Home/components/AppChart.dart';
import 'package:fidelidade_android/pages/Home/components/CoinExchangeModal.dart';
import 'package:fidelidade_android/pages/Home/components/HomeHeader.dart';
import 'package:fidelidade_android/pages/Home/components/cards/BalanceCoinsCard.dart';
import 'package:fidelidade_android/pages/Home/components/cards/BalanceMoneyCard.dart';
import 'package:fidelidade_android/pages/Home/components/cards/InformationCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String coinAmount = "1000";
  const HomePage({Key? key}) : super(key: key);

  void _openCoinExchangeModalBottomSheet(context) {
    final Size _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxWidth: _size.width * 0.8, minHeight: _size.height * 0.95),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return CoinExchangeModal(
            coinAmount: coinAmount,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const HomeHeader(name: 'Nome da pessoa', hasNotification: true),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BalanceCoinsCard(
              size: _size,
              coinAmount: coinAmount,
              openModal: _openCoinExchangeModalBottomSheet,
            ),
            BalanceMoneyCard(size: _size),
            InformationCard(
              size: _size,
            ),
            const AppChart(),
          ],
        ),
      ),
    );
  }
}
