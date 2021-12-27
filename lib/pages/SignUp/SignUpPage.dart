import 'package:fidelidade_android/pages/SignUp/components/SignUpForm.dart';
import 'package:flutter/material.dart';
import 'components/SignUpHeaderWidget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed('/signup/2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
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
              SignUpForm(
                formKey: _formKey,
                onSubmit: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
