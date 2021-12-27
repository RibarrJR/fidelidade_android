import 'package:fidelidade_android/components/CustomAppBar.dart';
import 'package:fidelidade_android/pages/Menu/components/MenuItem.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateTo(String value) {
      Navigator.pushNamed(context, "/$value");
    }

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Menu",
      ),
      body: ListView(
        children: [
          AppMenuItem(
            pageCall: navigateTo,
            icon: const Icon(Icons.person),
            pageName: "Perfil",
          ),
          AppMenuItem(
            pageCall: navigateTo,
            icon: const Icon(Icons.notifications),
            pageName: "Notificações",
          ),
          AppMenuItem(
            pageCall: navigateTo,
            icon: const Icon(Icons.wallet_giftcard),
            pageName: "Sacar",
          ),
          AppMenuItem(
            pageCall: navigateTo,
            icon: const Icon(Icons.settings),
            pageName: "Configurações",
          ),
        ],
      ),
    );
  }
}