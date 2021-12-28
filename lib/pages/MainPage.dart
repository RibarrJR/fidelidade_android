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

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _index = 0;
  final screens = const <Widget>[
    HomePage(
      key: PageStorageKey<String>('pageOne'),
    ),
    MenuPage(
      key: PageStorageKey<String>('pageTwo'),
    ),
  ];
  final PageStorageBucket _bucket = PageStorageBucket();
  late TabController _tabController;

  void onNavChanges(int index) {
    setState(() {
      _index = index;
      _tabController.animateTo(_index, duration: const Duration(seconds: 1));
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: IndexedStack(
      //   index: _index,
      //   children: screens,
      // ),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: const <Widget>[
      //     HomePage(),
      //     MenuPage(),
      //   ],
      // ),
      body: PageStorage(
        bucket: _bucket,
        child: TabBarView(
          key: const PageStorageKey<String>('tab'),
          controller: _tabController,
          children: screens,
        ),
      ),
      bottomNavigationBar: AppNavBar(
        onNavChange: onNavChanges,
      ),
    );
  }
}
