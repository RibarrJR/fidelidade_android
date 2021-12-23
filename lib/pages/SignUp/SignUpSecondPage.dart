import 'package:fidelidade_android/pages/SignUp/LabelWith.dart';
import 'package:fidelidade_android/pages/SignUp/SignUpHeaderWidget.dart';
import 'package:flutter/material.dart';

class SignUpSecondPage extends StatefulWidget {
  const SignUpSecondPage({Key? key}) : super(key: key);

  @override
  _SignUpsecondPageState createState() => _SignUpsecondPageState();
}

class _SignUpsecondPageState extends State<SignUpSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignUpHeader(
                  imagePath: 'images/registerCircles2.png',
                  iconColor: Colors.white.value,
                ),
                Text(
                  'Novo usuário',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff161E64),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      decoration: TextDecoration.none),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: Column(
                    children: [
                      TextFormField(
                          obscureText: true,
                          decoration: new InputDecoration(
                              hintText: 'Digite sua senha',
                              labelText: 'Senha')),
                      Container(
                        height: 15,
                      ),
                      TextFormField(
                          obscureText: true,
                          decoration: new InputDecoration(
                              hintText: 'Confirme sua senha',
                              labelText: 'Confirmar Senha')),
                      Container(
                        height: 15,
                      ),
                      TextFormField(
                          decoration: new InputDecoration(
                              hintText: 'Digite seu CEP', labelText: 'CEP')),
                      Container(
                        height: 15,
                      ),
                      TextFormField(
                          readOnly: true,
                          decoration: new InputDecoration(labelText: 'Estado')),
                      Container(
                        height: 15,
                      ),
                      TextFormField(
                          readOnly: true,
                          decoration: new InputDecoration(labelText: 'Cidade')),
                      Container(
                        height: 15,
                      ),
                      TextFormField(
                          readOnly: true,
                          decoration:
                              new InputDecoration(labelText: 'Endereço')),
                      Container(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LabelWithIcon(
                            label: 'Cadastrar',
                            onTap: () {},
                          ),
                        ],
                      ),
                      Container(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
