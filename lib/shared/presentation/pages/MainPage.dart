import 'package:fidelidade_android/features/Home/presentation/pages/HomePage.dart';
import 'package:fidelidade_android/features/Menu/presentation/pages/MenuPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/AppNavBar.dart';
import 'package:fidelidade_android/shared/controller/MainPageController.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  MainPageController mainPageController = MainPageController();

  final screens = [const HomePage(), const MenuPage()];

  void onNavChanges(int index) {
    mainPageController.setScreenIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return IndexedStack(
            index: mainPageController.screenIndex,
            children: screens,
          );
        },
      ),
      bottomNavigationBar: AppNavBar(
        onNavChange: onNavChanges,
      ),
    );
  }
}
