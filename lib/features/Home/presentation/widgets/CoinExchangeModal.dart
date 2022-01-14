import 'package:fidelidade_android/features/Home/controller/WalletsController.dart';
import 'package:fidelidade_android/features/Home/models/Wallets.dart';
import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/shared/presentation/widgets/Input.dart';
import 'package:fidelidade_android/utils/Images.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinExchangeModal extends StatefulWidget {
  final Wallet wallet;
  final double walletTargetId;

  void Function()? onModalDismiss;

  CoinExchangeModal(
      {Key? key,
      required this.wallet,
      this.onModalDismiss,
      required this.walletTargetId})
      : super(key: key);

  @override
  _CoinExchangeModalState createState() => _CoinExchangeModalState();
}

class _CoinExchangeModalState extends State<CoinExchangeModal> {
  WalletsController walletsController = WalletsController();
  late double coinAmount;
  late double walletId;
  late double _walletTargetId;
  double inputedValue = 0.0;
  String moneyAmount = "R\$ 00,00";
  void Function()? onModalDismiss;

  @override
  void initState() {
    coinAmount = widget.wallet.amount!;
    walletId = widget.wallet.id!.toDouble();
    _walletTargetId = widget.walletTargetId;
    onModalDismiss = widget.onModalDismiss;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.only(bottom: isKeyboardOpen ? 200 : 0),
        child: Wrap(
          children: <Widget>[
            CustomAppBar(
              title: 'Trocar',
              isOnmodal: true,
            ),
            Column(
              children: [
                const Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 48,
                    color: primaryColor,
                  ),
                ),
                const Center(
                  child: Text(
                    "A cada 100 Moedas, você pode trocar por R\$ 1,00.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: primaryColor, fontSize: 24),
                  ),
                ),
                Card(
                  color: primaryColor,
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                          'Você Possui:',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                  coinAmount.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = moneyColor,
                                  ),
                                ),
                                Text(
                                  coinAmount.toString(),
                                  style: const TextStyle(
                                    fontSize: 40,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Input(
                    labelText: "Moedas",
                    hintText: "Moedas",
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        if (value == "") {
                          inputedValue = 0.0;
                        } else {
                          inputedValue = double.parse(value);
                        }
                        var valueConverted = inputedValue / 100;
                        moneyAmount = 'R\$ $valueConverted';
                      });
                    },
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  color: secondaryColor,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 22),
                    child: Center(
                      child: Text(
                        moneyAmount,
                        style: const TextStyle(color: moneyColor, fontSize: 48),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                          width: _size.width * 0.73,
                          height: 40,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                enableFeedback: inputedValue > 0 &&
                                        inputedValue <= coinAmount
                                    ? true
                                    : false,
                                shadowColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(
                                    inputedValue > 0 &&
                                            inputedValue <= coinAmount
                                        ? primaryColor
                                        : disabledBg),
                              ),
                              onPressed: () async {
                                if (inputedValue > 0 &&
                                    inputedValue <= coinAmount) {
                                  var body = {
                                    "walletOriginId": walletId,
                                    "walletTargetId": _walletTargetId,
                                    "quantity": inputedValue
                                  };
                                  try {
                                    walletsController
                                        .transferBetweenWallets(body)
                                        .then((value) => {
                                              Navigator.pop(context),
                                              onModalDismiss!()
                                            });
                                  } catch (e) {
                                    throw Exception(e);
                                  }
                                }
                              },
                              child: Text(
                                'Trocar',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: inputedValue > 0 &&
                                            inputedValue <= coinAmount
                                        ? Colors.white
                                        : gray),
                              ))),
                      Container(
                          width: _size.width * 0.73,
                          height: 40,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        width: 2,
                                        style: BorderStyle.solid,
                                        color: primaryColor)),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancelar',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 18),
                              ))),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
