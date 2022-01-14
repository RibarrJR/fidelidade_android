// ignore_for_file: unnecessary_const

import 'package:fidelidade_android/features/Settings/presentation/widgets/AboutModal.dart';
import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool activedNotifications = true;
  bool activedDarkMode = false;

  @override
  Widget build(BuildContext context) {
    void _openChangePasswordModal(context) {
      final Size _size = MediaQuery.of(context).size;
      showModalBottomSheet(
          isScrollControlled: true,
          constraints: BoxConstraints(
              maxWidth: _size.width * 0.9,
              minHeight: _size.height * 0.50,
              maxHeight: _size.height * 0.60),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          context: context,
          builder: (BuildContext bc) {
            return const AboutModal();
          });
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: "Configurações",
        automaticallyImplyLeading: true,
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Notificações',
                      style: const TextStyle(
                          color: kPrimaryColor, fontSize: 18.0)),
                  Switch(
                      value: activedNotifications,
                      onChanged: (value) {
                        setState(() {
                          activedNotifications = value;
                        });
                      })
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1, color: kPrimaryColor),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Mudar tema",
                      style: const TextStyle(
                          color: kPrimaryColor, fontSize: 18.0)),
                  Switch(
                      value: activedDarkMode,
                      onChanged: (value) {
                        setState(() {
                          activedDarkMode = value;
                        });
                      })
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1, color: kPrimaryColor),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _openChangePasswordModal(context);
                    },
                    child: const Text('Sobre o +Fidelidade',
                        style: const TextStyle(
                            color: kPrimaryColor, fontSize: 18.0)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(height: 1, color: kPrimaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
