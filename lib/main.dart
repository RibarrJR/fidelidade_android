import 'package:flutter/material.dart';

import './pages/HomePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "+Fideliade",
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}
