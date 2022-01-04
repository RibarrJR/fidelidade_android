import 'package:fidelidade_android/shared/presentation/widgets/RoundedButton.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/AppChart.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/BalanceCoinsCard.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/BalanceMoneyCard.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/CoinExchangeModal.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/HomeHeader.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/InformationCard.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String coinAmount = "1000";
  const HomePage({Key? key}) : super(key: key);

  void _openCoinExchangeModalBottomSheet(context, isCoinToMoney) {
    final Size _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxWidth: _size.width * 0.8, minHeight: _size.height * 0.7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return CoinExchangeModal(
              coinAmount: coinAmount, isCoinToMoney: isCoinToMoney);
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
            BalanceMoneyCard(
              size: _size,
              openModal: _openCoinExchangeModalBottomSheet,
            ),
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
