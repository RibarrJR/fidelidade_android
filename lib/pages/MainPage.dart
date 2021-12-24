import 'package:fidelidade_android/pages/Home/HomePage.dart';
import 'package:fidelidade_android/pages/Menu/MenuPage.dart';
import 'package:flutter/material.dart';
import '../widget/stateful/AppNavBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final screens = [const HomePage(), const MenuPage()];

  void onNavChanges(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: screens,
      ),
      bottomNavigationBar: AppNavBar(
        onNavChange: onNavChanges,
      ),
    );
  }
}
