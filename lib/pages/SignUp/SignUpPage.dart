import 'package:fidelidade_android/pages/SignUp/SignUpSecondPage.dart';
import 'package:fidelidade_android/pages/SignUp/components/SignUpForm.dart';
import 'package:flutter/material.dart';

import 'components/SignUpHeaderWidget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // late AnimationController _controller;
  // late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();
    // _controller =
    //     AnimationController(duration: Duration(seconds: 3), vsync: this);
    // offsetAnimation = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset.zero)
    //     .animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeIn,
    // ));
  }

  void _submit(data) {
    print(data);
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
                imagePath: 'assets/images/registerCircles.png',
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
                onSubmit: (data) => _submit(data),
              )
            ],
          ),
        ),
      ),
    );
  }
}
