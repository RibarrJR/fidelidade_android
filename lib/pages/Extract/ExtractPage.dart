import 'package:fidelidade_android/components/CustomAppBar.dart';
import 'package:flutter/material.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Extrato",
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 20,
          ),
        ],
      ),
    );
  }
}
