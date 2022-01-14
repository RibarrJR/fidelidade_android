// @dart=2.9
import 'package:fidelidade_android/features/Extract/presentation/pages/ExtractPage.dart';
import 'package:fidelidade_android/features/Login/presentation/pages/LoginScreen.dart';
import 'package:fidelidade_android/features/Settings/presentation/pages/SettingsPage.dart';
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
import 'package:get_it/get_it.dart';

import 'package:fidelidade_android/shared/controller/MainPageController.dart';
import 'package:fidelidade_android/features/Profile/controller/ProfilePictureController.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static GlobalKey mtAppKey = GlobalKey();

  @override
  void initState() {
    _registerStores();

    super.initState();
  }

  void _registerStores() {
    // Para gerar um estado de escopo global é preciso registralo como singleton

    // 1 - Gerar o getIt
    var getIt = GetIt.I;

    // 2 - Registrar o controller como singleton (Singleton é uma classe que só se instancia uma vez e com escopo global)
    getIt.registerSingleton(MainPageController());
    getIt.registerSingleton(ProfilePictureController());

    // 3 - Ver o arquivo utils/global.dart
  }

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
        '/settings': (context) => const SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
