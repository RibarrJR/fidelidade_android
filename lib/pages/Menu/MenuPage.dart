import 'package:fidelidade_android/components/CustomAppBar.dart';
import 'package:fidelidade_android/pages/Menu/components/MenuItem.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Menu",
      ),
      body: ListView(
        children: const [
          AppMenuItem(
            pageCall: '',
            icon: Icon(Icons.person),
            pageName: "Perfil",
          ),
          AppMenuItem(
            pageCall: 'notifications',
            icon: Icon(Icons.notifications),
            pageName: "Notificações",
          ),
          AppMenuItem(
            pageCall: 'withdraw/value',
            icon: Icon(Icons.wallet_giftcard),
            pageName: "Sacar",
          ),
          AppMenuItem(
            pageCall: '',
            icon: Icon(Icons.settings),
            pageName: "Configurações",
          ),
        ],
      ),
    );
  }
}
