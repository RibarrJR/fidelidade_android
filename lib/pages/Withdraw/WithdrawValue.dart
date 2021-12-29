import 'package:fidelidade_android/components/CustomAppBar.dart';
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
            'Quanto gostaria de sacar',
            textAlign: TextAlign.center,
          ),
          Container(
            child: Column(
                children: const [Text('Saldo total'), Text('R\$ 3.200.00')]),
          )
        ],
      ),
    );
  }
}
