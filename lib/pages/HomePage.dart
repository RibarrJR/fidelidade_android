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
      appBar: AppBar(
        title: const Text('+Fidelidade'),
      ),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Content"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          child: const Text(
            'Menu content',
            style: TextStyle(fontSize: 60, color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
