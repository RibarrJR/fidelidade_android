import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/features/Menu/presentation/widgets/MenuItem.dart';
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
            pageCall: 'profile',
            icon: Icon(Icons.person),
            pageName: "Perfil",
          ),
          AppMenuItem(
            pageCall: 'notifications',
            icon: Icon(Icons.notifications),
            pageName: "Notificações",
          ),
          AppMenuItem(
            pageCall: 'extract',
            icon: Icon(Icons.description),
            pageName: "Extrato",
          ),
          AppMenuItem(
            pageCall: 'withdraw',
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
