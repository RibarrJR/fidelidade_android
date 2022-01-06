import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/features/Withdraw/presentation/widgets/PixCardWidget.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class PixPage extends StatefulWidget {
  const PixPage({Key? key}) : super(key: key);

  @override
  _PixPageState createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Sacar - Pix",
          automaticallyImplyLeading: true,
        ),
        body: ListView(
          children: [
            Container(
              height: 15,
            ),
            const Center(
              child: Text(
                'Selecione a Chave',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    letterSpacing: 2.0),
              ),
            ),
            Container(
              height: 15,
            ),
            PixCardWidget(
                type: 'Chave aleatória ',
                value: "98a7dfia...kjeiu#f&"),
            PixCardWidget(type: 'CPF', value: "126.***.***-08"),
          ],
        ));
  }
}
