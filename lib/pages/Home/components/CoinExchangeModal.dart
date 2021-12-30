import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:fidelidade_android/components/CustomAppBar.dart';
import 'package:fidelidade_android/components/RoundedInputField.dart';
import 'package:fidelidade_android/constants.dart';
import 'package:flutter/material.dart';

class CoinExchangeModal extends StatefulWidget {
  String coinAmount;

  CoinExchangeModal({Key? key, required this.coinAmount}) : super(key: key);

  @override
  _CoinExchangeModalState createState() => _CoinExchangeModalState();
}

class _CoinExchangeModalState extends State<CoinExchangeModal> {
  late String coinAmount;
  String moneyAmount = "R\$ 00,00";

  @override
  void initState() {
    coinAmount = widget.coinAmount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return SingleChildScrollView(
      reverse: true,
      padding: EdgeInsets.only(bottom: isKeyboardOpen ? 290 : 0),
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
                            child: Image.asset('assets/images/coin.png'),
                          ),
                          Stack(
                            children: <Widget>[
                              Text(
                                coinAmount,
                                style: TextStyle(
                                  fontSize: 40,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 6
                                    ..color = moneyColor,
                                ),
                              ),
                              Text(
                                coinAmount,
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
              RoundedInputField(
                hintText: "Moedas",
                onChanged: (value) {
                  var textDouble = double.parse(value);
                  var valueConverted = textDouble / 100;
                  setState(() {
                    moneyAmount = 'R\$ $valueConverted';
                  });
                },
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 56),
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
                          shadowColor: MaterialStateProperty.all(Colors.white),
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
          )
        ],
      ),
    );
    ;
  }
}
