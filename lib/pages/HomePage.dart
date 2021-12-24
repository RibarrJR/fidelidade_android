import 'package:flutter/material.dart';
import '../widget/stateful/AppNavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final screens = [const HomeContent(), const MenuContent()];

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

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Content"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          child: const Text('Home content'),
        ),
      ),
    );
  }
}

class MenuContent extends StatelessWidget {
  const MenuContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 84,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 32.00),
                width: _size.width,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                height: 52,
                child: const Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 36),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.00),
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('one')),
            ElevatedButton(onPressed: () {}, child: const Text('two')),
            ElevatedButton(onPressed: () {}, child: const Text('3')),
          ],
        ),
      ),
    );
  }
}
