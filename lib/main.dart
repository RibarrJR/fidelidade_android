// @dart=2.9
import 'package:fidelidade_android/constants.dart';
import 'package:fidelidade_android/pages/Login/LoginScreen.dart';
import 'package:fidelidade_android/pages/MainPage.dart';
import 'package:fidelidade_android/pages/Notifications/NotificationsPage.dart';
import 'package:fidelidade_android/pages/SignUp/SignUpPage.dart';
import 'package:fidelidade_android/pages/SignUp/SignUpSecondPage.dart';
import 'package:fidelidade_android/pages/Profile/ProfilePage.dart';
import 'package:fidelidade_android/pages/Welcome/WelcomeScreen.dart';
import 'package:fidelidade_android/pages/Withdraw/WithdrawPage.dart';
import 'package:fidelidade_android/pages/Withdraw/WithdrawPixPage.dart';
import 'package:fidelidade_android/pages/Withdraw/WithdrawTedPage.dart';
import 'package:fidelidade_android/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  static GlobalKey mtAppKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: mtAppKey,
      title: "+Fideliade",
      initialRoute: '/',
      theme: MyTheme.defaultTheme,
      routes: {
        '/': (context) => WelcomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/home': (context) => const MainPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/signin': (context) =>  LoginScreen(),
        '/signup': (context) => const SignUpPage(),
        '/signup/2': (context) => const SignUpSecondPage(),
        '/withdraw': (context) => const WithdrawPage(),
        '/pix': (context) => const PixPage(),
        '/ted': (context) => const WithDrawTedPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
