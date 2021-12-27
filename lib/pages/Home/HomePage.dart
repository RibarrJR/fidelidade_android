import 'package:flutter/material.dart';
import 'components/AppChart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Content"),
      ),
      body: Column(
        children: const [
          AppChart(),
        ],
      ),
    );
  }
}
