import 'package:fidelidade_android/pages/HomePage.dart';
import 'package:fidelidade_android/pages/Profile/ProfileScreen.dart';
import 'package:fidelidade_android/pages/Welcome/WelcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "+Fideliade",
      initialRoute: '/profile',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
