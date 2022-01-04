import 'package:fidelidade_android/features/Login/presentation/widgets/ForgotPassword.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedButton.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedPasswordField.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedInputField.dart';
import 'package:fidelidade_android/features/Login/presentation/widgets/LoginBackground.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 111,
                    child: Image.asset('assets/images/FLogo.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Center(
                child: Container(
                    width: 322,
                    height: 75,
                    child: Image.asset('assets/images/Bemvindo.png')),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              labelText: "CPF",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Entrar",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            ForgotPassword(
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
