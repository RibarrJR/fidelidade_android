import 'package:fidelidade_android/pages/Home/components/HomeHeader.dart';
import 'package:flutter/material.dart';
import 'components/AppChart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeHeader(name: 'Nome da pessoa', hasNotification: true),
      body: Column(
        children: const [
          AppChart(),
        ],
      ),
    );
  }
}
