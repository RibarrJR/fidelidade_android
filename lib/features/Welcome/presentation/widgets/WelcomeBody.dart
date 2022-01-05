import 'package:fidelidade_android/shared/presentation/widgets/RoundedButton.dart';
import 'package:fidelidade_android/features/Welcome/presentation/widgets/WelcomeBackground.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:fidelidade_android/features/Login/presentation/pages/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Center(
              child: SizedBox(
                  width: 350,
                  height: 83,
                  child: SvgPicture.asset('assets/images/Logo.svg')),
            ),
            SizedBox(height: size.height * 0.10),
            RoundedButton(
              text: "Entrar",
              press: () {
                Navigator.of(context).pushNamed('/login');
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
