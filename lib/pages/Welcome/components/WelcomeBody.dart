import 'package:fidelidade_android/components/RoundedButton.dart';
import 'package:fidelidade_android/constants.dart';
import 'package:fidelidade_android/pages/Login/LoginScreen.dart';
import 'package:fidelidade_android/pages/SignUp/SignUpPage.dart';
import 'package:fidelidade_android/pages/Welcome/components/WelcomeBackground.dart';
import 'package:flutter/material.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*Text(
              "WELCOME TO EDU",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),*/
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Center(
                child: Container(
                    width: 350,
                    height: 83,
                    child: Image.asset('assets/images/Logo.png')),
              ),
            ),
            SizedBox(height: size.height * 0.10),
            RoundedButton(
              text: "Entrar",
              press: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Center(
                child: Container(
                    width: 120,
                    height: 35,
                    child: Image.asset('assets/images/ou.png')),
              ),
            ),
            RoundedButton(
              text: "Novo usuário",
              color: kPrimaryLightColor,
              textColor: kPrimaryColor,
              press: () {
                Navigator.of(context).pushNamed('/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
