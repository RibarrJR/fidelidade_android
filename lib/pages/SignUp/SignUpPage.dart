
import 'package:fidelidade_android/pages/SignUp/SignUpSecondPage.dart';
import 'package:flutter/material.dart';

import 'LabelWith.dart';
import 'SignUpHeaderWidget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SignUpHeader(
              imagePath: 'images/registerCircles.png',
              iconColor: 0xff161E64,
            ),
            Container(
              height: 10,
            ),
            Text(
              'Novo usuário',
              style: TextStyle(
                  color: Color(0xff161E64),
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            Container(
              height: 20,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: new InputDecoration(
                            hintText: 'Digite seu nome completo',
                            labelText: 'Nome Completo')),
                    Container(
                      height: 15,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                            hintText: 'Digite seu melhor email',
                            labelText: 'E-mail')),
                    Container(
                      height: 15,
                    ),
                    TextFormField(
                        decoration: new InputDecoration(
                            hintText: 'Digite seu CPF', labelText: 'CPF')),
                    Container(
                      height: 60,
                    ),
                    LabelWithIcon(
                      label: 'Proximo',
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SignUpSecondPage()));
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
