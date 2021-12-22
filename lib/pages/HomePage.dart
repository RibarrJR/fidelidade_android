import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('+Fidelidade'),
      ),
      body: Container(
        width: 200,
        height: 200,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
            backgroundColor: Colors.red,
          ),
        ],
        currentIndex: 0,
        // backgroundColor: Colors.green,
        selectedItemColor: Colors.blue[900],
        onTap: (value) {
          print(value);
        },
      ),
    );
  }
}
