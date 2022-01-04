import 'package:fidelidade_android/features/SignUp/presentation/widgets/SignUpHeaderWidget.dart';
import 'package:fidelidade_android/features/SignUp/presentation/widgets/SignUpSecondForm.dart';
import 'package:flutter/material.dart';

class SignUpSecondPage extends StatefulWidget {
  const SignUpSecondPage({Key? key}) : super(key: key);
  @override
  _SignUpsecondPageState createState() => _SignUpsecondPageState();
}

class _SignUpsecondPageState extends State<SignUpSecondPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submit(data) {
    print(data);
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).popAndPushNamed('/home');
    }
  }

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
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('/signup');
                  },
                  imagePath: 'assets/images/registerCircles2.png',
                  iconColor: Colors.white.value,
                ),
                const Text(
                  'Novo usuário',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff161E64),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      decoration: TextDecoration.none),
                ),
                SecondForm(
                  formKey: _formKey,
                  onSubmit: (data) => _submit(data),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
