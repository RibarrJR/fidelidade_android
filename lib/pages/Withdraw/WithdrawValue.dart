import 'package:fidelidade_android/components/CustomAppBar.dart';
import 'package:fidelidade_android/components/Input.dart';
import 'package:flutter/material.dart';

class WithdrawValue extends StatelessWidget {
  final myController = TextEditingController();

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
            'Quanto gostaria de sacar',
            textAlign: TextAlign.center,
          ),
          Container(
            child: Column(
                children: const [Text('Saldo total'), Text('R\$ 3.200.00')]),
          ),
          Column(
            children: [
              const Text('Valor'),
              // Input(
              //     controller: myController,
              //     labelText: 'Entre com o valor desejado')
            ],
          )
        ],
      ),
    );
  }
}
