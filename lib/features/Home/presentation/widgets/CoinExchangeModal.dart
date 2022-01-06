import 'dart:html';

import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/shared/presentation/widgets/Input.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedInputField.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class CoinExchangeModal extends StatefulWidget {
  String amount;
  bool isCoinToMoney;

  CoinExchangeModal(
      {Key? key, required this.amount, required this.isCoinToMoney})
      : super(key: key);

  @override
  _CoinExchangeModalState createState() => _CoinExchangeModalState();
}

class _CoinExchangeModalState extends State<CoinExchangeModal> {
  late String amount;
  late bool isCoinToMoney;
  String convertedAmount = "00,00";

  @override
  void initState() {
    amount = widget.amount;
    isCoinToMoney = widget.isCoinToMoney;
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
              title: isCoinToMoney ? 'Trocar' : 'Converter',
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
                Center(
                  child: Text(
                    isCoinToMoney
                        ? 'A cada 100 Moedas, você pode trocar por R\$ 1,00'
                        : 'A cada R\$ 1,00, você pode converter por 100 moedas',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: primaryColor, fontSize: 24),
                  ),
                ),
                Column(
                  verticalDirection: isCoinToMoney
                      ? VerticalDirection.down
                      : VerticalDirection.up,
                  children: [
                    Card(
                      color: primaryColor,
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          if (isCoinToMoney) const YouHaveText(),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/images/coin.png'),
                                ),
                                Stack(
                                  children: <Widget>[
                                    Text(
                                      isCoinToMoney ? amount : convertedAmount,
                                      style: TextStyle(
                                        fontSize: 40,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6
                                          ..color = moneyColor,
                                      ),
                                    ),
                                    Text(
                                      isCoinToMoney ? amount : convertedAmount,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Input(
                        labelText: isCoinToMoney ? "Moedas" : "Reais",
                        hintText: "Moedas",
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          var textDouble =
                              value == "" ? 0 : double.parse(value);
                          var valueConverted = isCoinToMoney
                              ? textDouble / 100
                              : textDouble * 100;
                          setState(() {
                            convertedAmount = '$valueConverted';
                          });
                        },
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.all(16),
                      color: secondaryColor,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 22),
                        child: Column(
                          children: [
                            if (!isCoinToMoney) const YouHaveText(),
                            Center(
                              child: Text(
                                isCoinToMoney ? convertedAmount : amount,
                                style: const TextStyle(
                                    color: moneyColor, fontSize: 48),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                          width: _size.width * 0.73,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                enableFeedback: false,
                                shadowColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(disabledBg),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Trocar',
                                style: TextStyle(color: gray),
                              ))),
                      // Container(
                      //     width: _size.width * 0.73,
                      //     margin: const EdgeInsets.only(bottom: 10),
                      //     child: ElevatedButton(
                      //         onPressed: () {}, child: Text('hue'))),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class YouHaveText extends StatelessWidget {
  const YouHaveText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
          child: Text(
        'Você Possui:',
        style: TextStyle(color: Colors.white, fontSize: 24),
      )),
    );
  }
}
