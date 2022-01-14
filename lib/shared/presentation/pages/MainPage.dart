import 'package:fidelidade_android/features/Home/presentation/pages/HomePage.dart';
import 'package:fidelidade_android/features/Menu/presentation/pages/MenuPage.dart';
import 'package:fidelidade_android/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/AppNavBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  // Para escopo local, gerar como na linha abaixo
  // MainPageController mainPageController = MainPageController();

  // Para escopo global, veja os arquivos /main.dart e utils/global.dart

  late TabController _tabController;
  final screens = [const HomePage(), const MenuPage()];

  void onNavChanges(int index) {
    // ação do controller
    mainPageController.setScreenIndex(index);
    _tabController.animateTo(mainPageController.screenIndex,
        duration: const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // o widget Observer é necessário para o ter refresh da tela em alteração de estado
      body: Observer(
        builder: (context) {
          // return IndexedStack(
          //   // o estado do controller
          //   index: mainPageController.screenIndex,
          //   children: screens,
          // );
          return TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              HomePage(),
              MenuPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: AppNavBar(
        onNavChange: onNavChanges,
      ),
    );
  }
}
