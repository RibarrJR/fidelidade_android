import 'package:fidelidade_android/main.dart';
import 'package:fidelidade_android/pages/SignUp/SignUpSecondPage.dart';
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

  void _submit(data) {
    print(data);
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        "/signup/2"
        // CustomNamedPageTransition(App.mtAppKey, "/signup/2"),
      );
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
                onSubmit: (data) => _submit(data),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNamedPageTransition extends PageRouteBuilder {
  CustomNamedPageTransition(
    GlobalKey materialAppKey,
    String routeName, {
    Object? arguments,
  }) : super(
          settings: RouteSettings(
            arguments: arguments,
            name: routeName,
          ),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            assert(materialAppKey.currentWidget != null);
            assert(materialAppKey.currentWidget is MaterialApp);
            var mtapp = materialAppKey.currentWidget as MaterialApp;
            var routes = mtapp.routes;
            assert(routes!.containsKey(routeName));
            return routes![routeName]!(context);
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: Duration(seconds: 1),
        );
}
