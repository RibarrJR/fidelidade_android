import 'package:fidelidade_android/features/Home/presentation/widgets/AppChart.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/BalanceCoinsCard.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/BalanceMoneyCard.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/CoinExchangeModal.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/HomeHeader.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/InformationCard.dart';
import 'package:fidelidade_android/features/Home/presentation/widgets/MoneyExchangeModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fidelidade_android/features/Home/controller/WalletsController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WalletsController walletsController = WalletsController();

  void _openCoinExchangeModalBottomSheet(context) {
    final Size _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxWidth: _size.width * 0.9, minHeight: _size.height * 0.7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return CoinExchangeModal(
              wallet: walletsController.walletsModel!.wallet![0],
              walletTargetId:
                  walletsController.walletsModel!.wallet![1].id!.toDouble(),
              onModalDismiss: loadWallets);
        });
  }

  void _openMoneyExchangeModalBottomSheet(context) {
    final Size _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxWidth: _size.width * 0.9, minHeight: _size.height * 0.7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return MoneyExchangeModal(
              wallet: walletsController.walletsModel!.wallet![1],
              walletTargetId:
                  walletsController.walletsModel!.wallet![0].id!.toDouble(),
              onModalDismiss: loadWallets);
        });
  }

  void loadWallets() {
    walletsController.getWallets();
  }

  @override
  void initState() {
    loadWallets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const HomeHeader(name: 'Nome da pessoa', hasNotification: true),
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          return Column(
            children: <Widget>[
              // FutureBuilder<String>(
              //   future: getWallets(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       setState(() {
              //         _wallets = jsonDecode((snapshot.data ?? ''));
              //       });
              //       return Container();
              //     } else {
              //       return const CircularProgressIndicator(
              //         color: moneyColor,
              //       );
              //     }
              //   },
              // ),
              BalanceCoinsCard(
                size: _size,
                coinAmount: walletsController.walletsModel == null
                    ? -1
                    : walletsController.walletsModel!.wallet![0].amount!
                        .toDouble(),
                openModal: _openCoinExchangeModalBottomSheet,
              ),
              BalanceMoneyCard(
                size: _size,
                moneyAmout: walletsController.walletsModel == null
                    ? -1
                    : walletsController.walletsModel!.wallet![1].amount!
                        .toDouble(),
                openModal: _openMoneyExchangeModalBottomSheet,
              ),
              InformationCard(
                size: _size,
              ),
              const AppChart(),
            ],
          );
        }),
      ),
    );
  }
}
