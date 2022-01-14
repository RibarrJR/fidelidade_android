import 'package:fidelidade_android/features/Home/controller/WalletsController.dart';
import 'package:fidelidade_android/features/Home/models/Wallets.dart';
import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/shared/presentation/widgets/Input.dart';
import 'package:fidelidade_android/utils/Images.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoneyExchangeModal extends StatefulWidget {
  Wallet wallet;
  double walletTargetId;
  void Function()? onModalDismiss;

  MoneyExchangeModal(
      {Key? key,
      this.onModalDismiss,
      required this.walletTargetId,
      required this.wallet})
      : super(key: key);

  @override
  _MoneyExchangeModalState createState() => _MoneyExchangeModalState();
}

class _MoneyExchangeModalState extends State<MoneyExchangeModal> {
  WalletsController walletsController = WalletsController();
  late double moneyAmount;
  late double walletId;
  late double _walletTargetId;
  double inputedValue = 0.0;
  void Function()? onModalDismiss;

  @override
  void initState() {
    moneyAmount = widget.wallet.amount!;
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
              title: 'Converter',
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
                    "A cada R\$ 1,00 , você pode trocar por 100.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: primaryColor, fontSize: 24),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  color: secondaryColor,
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
                        margin: const EdgeInsets.symmetric(vertical: 22),
                        child: Center(
                          child: Text(
                            'R\$ $moneyAmount',
                            style: const TextStyle(
                                color: moneyColor, fontSize: 48),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Input(
                    labelText: "R\$",
                    hintText: "Valor em real",
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        if (value == "") {
                          inputedValue = 0.0;
                        } else {
                          inputedValue = double.parse(value);
                        }
                      });
                    },
                  ),
                ),
                Card(
                  color: primaryColor,
                  margin: const EdgeInsets.all(16),
                  child: Container(
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
                              (inputedValue * 100).toString(),
                              style: TextStyle(
                                fontSize: 40,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 6
                                  ..color = moneyColor,
                              ),
                            ),
                            Text(
                              (inputedValue * 100).toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
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
                                        inputedValue <= moneyAmount
                                    ? true
                                    : false,
                                shadowColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(
                                    inputedValue > 0 &&
                                            inputedValue <= moneyAmount
                                        ? primaryColor
                                        : disabledBg),
                              ),
                              onPressed: () async {
                                if (inputedValue > 0 &&
                                    inputedValue <= moneyAmount) {
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
                                              onModalDismiss!(),
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
                                            inputedValue <= moneyAmount
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
