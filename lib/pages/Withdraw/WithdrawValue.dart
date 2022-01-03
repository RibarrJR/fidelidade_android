import 'package:fidelidade_android/components/CustomAppBar.dart';
import 'package:fidelidade_android/components/Input.dart';
import 'package:fidelidade_android/components/RoundedButton.dart';
import 'package:fidelidade_android/components/RoundedInputField.dart';
import 'package:flutter/material.dart';

class WithdrawValue extends StatelessWidget {
  const WithdrawValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sacar - Pix",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Quanto gostaria de sacar?',
            textAlign: TextAlign.center,
          ),
          Container(
            child: Column(
                children: const [Text('Saldo total'), Text('R\$ 3.200.00')]),
          ),
          RoundedInputField(
            labelText: 'Valor',
            hintText: 'Entre com o valor desejado',
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "Sacar",
            press: () {},
          ),
        ],
      ),
    );
  }
}
