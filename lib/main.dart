import 'package:fidelidade_android/pages/SignUp/SignUpPage.dart';
import 'package:flutter/material.dart';

import './pages/HomePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      initialRoute: '/',
      routes: {
        '/cadastro': (context) => SignUpPage(),
      },
    );
  }
}
