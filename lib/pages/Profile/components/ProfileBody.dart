import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:fidelidade_android/constants.dart';
import 'package:fidelidade_android/pages/Bank/BankChips.dart';
import 'package:fidelidade_android/pages/Profile/components/ProfileBackground.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ProfileBackground(
        child: Padding(
          padding: EdgeInsets.only(top: 120, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: CircularProfileAvatar(
                  "https://avatars.githubusercontent.com/u/4026715?v=4",
                  borderWidth: 0,
                  radius: 60.0,
                ),
              ),
              const SizedBox(height: 5.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Eder Taveira",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "28/02/1983",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(TextSpan(children: <InlineSpan>[
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.phone_android,
                          color: Colors.white, size: 18),
                    ),
                  ),
                  TextSpan(
                      text: "+55 61 98250-0159",
                      style: TextStyle(color: Colors.white, fontSize: 18.0))
                ])),
              ),
              const SizedBox(height: 5.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(TextSpan(children: <InlineSpan>[
                  WidgetSpan(
                    child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child:
                            Icon(Icons.email, color: Colors.white, size: 18)),
                  ),
                  TextSpan(
                      text: "edertaveira@gmail.com",
                      style: TextStyle(color: Colors.white, fontSize: 18.0))
                ])),
              ),
              const SizedBox(height: 5.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(TextSpan(children: <InlineSpan>[
                  WidgetSpan(
                    child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.location_on,
                            color: Colors.white, size: 18)),
                  ),
                  TextSpan(
                      text: "Brasília-DF",
                      style: TextStyle(color: Colors.white, fontSize: 18.0))
                ])),
              )
            ],
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child:
                        Icon(Icons.password, color: kPrimaryColor, size: 18)),
              ),
              TextSpan(
                  text: "Alterar Senha",
                  style: TextStyle(color: kPrimaryColor, fontSize: 18.0))
            ]),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(TextSpan(children: <InlineSpan>[
            WidgetSpan(
              child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.account_balance,
                      color: kPrimaryColor, size: 18)),
            ),
            TextSpan(
                text: "Lista de Bancos",
                style: TextStyle(color: kPrimaryColor, fontSize: 18.0))
          ])),
        ),
      ),
      const BankChips(),
      GestureDetector(
        onTap: () {
          print(1);
        },
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.logout, color: kPrimaryColor, size: 18)),
              ),
              TextSpan(
                  text: "Finalizar Sessão",
                  style: TextStyle(color: kPrimaryColor, fontSize: 18.0))
            ])),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child:
                        Icon(Icons.power_off, color: kPrimaryColor, size: 18)),
              ),
              TextSpan(
                  text: "Apagar Conta",
                  style: TextStyle(color: Colors.red, fontSize: 18.0))
            ])),
          ),
        ),
      ),
    ]);
  }
}
