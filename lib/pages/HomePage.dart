import 'package:flutter/material.dart';
import '../widget/stateful/AppNavBar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('+Fidelidade'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
