// @dart=2.9
import 'package:fidelidade_android/features/Extract/presentation/pages/ExtractPage.dart';
import 'package:fidelidade_android/features/Login/presentation/pages/LoginScreen.dart';
import 'package:fidelidade_android/features/SignUp/presentation/pages/SignUpPage.dart';
import 'package:fidelidade_android/features/SignUp/presentation/pages/SignUpSecondPage.dart';
import 'package:fidelidade_android/features/Withdraw/presentation/pages/WithdrawPage.dart';
import 'package:fidelidade_android/features/Withdraw/presentation/pages/WithdrawPixPage.dart';
import 'package:fidelidade_android/features/Withdraw/presentation/pages/WithdrawTedPage.dart';
import 'package:fidelidade_android/features/Withdraw/presentation/pages/WithdrawValue.dart';
import 'package:fidelidade_android/shared/presentation/pages/MainPage.dart';
import 'package:fidelidade_android/features/Notifications/presentation/pages/NotificationsPage.dart';
import 'package:fidelidade_android/features/Profile/presentation/pages/ProfilePage.dart';
import 'package:fidelidade_android/features/Welcome/presentation/pages/WelcomeScreen.dart';
import 'package:fidelidade_android/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  static GlobalKey mtAppKey = GlobalKey();
  App({Key key}) : super(key: key);
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
        '/login': (context) => LoginScreen(),
        '/signup': (context) => const SignUpPage(),
        '/signup/2': (context) => const SignUpSecondPage(),
        '/withdraw/value': (context) => const WithdrawValue(),
        '/withdraw': (context) => const WithdrawPage(),
        '/pix': (context) => const PixPage(),
        '/ted': (context) => const WithDrawTedPage(),
        '/extract': (context) => const ExtractPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
