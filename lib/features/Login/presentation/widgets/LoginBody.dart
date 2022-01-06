import 'package:fidelidade_android/features/Login/presentation/widgets/ForgotPassword.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedButton.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedPasswordField.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedInputField.dart';
import 'package:fidelidade_android/features/Login/presentation/widgets/LoginBackground.dart';
import 'package:fidelidade_android/utils/Images.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Center(
              child: SvgPicture.asset(
                miniLogoImg,
                width: 85,
                height: 85,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                'Bem vindo!',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 55,
                    fontWeight: FontWeight.bold),
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
