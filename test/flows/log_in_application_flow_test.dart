// @dart=2.9

import 'package:fidelidade_android/features/Home/presentation/widgets/AppChart.dart';
import 'package:fidelidade_android/features/Welcome/presentation/pages/WelcomeScreen.dart';
import 'package:fidelidade_android/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/buttonMatcher.dart';

void main() {
  testWidgets(
      'Quando iniciar a aplicação deve apresentar na tela o botão de login e o botão de Novo usuário',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(routes: {
        '/': (context) => WelcomeScreen(),
      }),
    );

    final logInButton = find
        .byWidgetPredicate((widget) => featureButtonMatcher(widget, 'Entrar'));
    expect(logInButton, findsOneWidget);

    final singUpbutton = find.byWidgetPredicate(
        (widget) => featureButtonMatcher(widget, 'Novo usuário'));
    expect(singUpbutton, findsOneWidget);
  });

  testWidgets(
      'Quando o usuário logar na aplicação deve aparecer as informações do usuário com gráfico de transações',
      (WidgetTester tester) async {
    await tester.pumpWidget(App());
    final logInButton = find
        .byWidgetPredicate((widget) => featureButtonMatcher(widget, 'Entrar'));

    expect(logInButton, findsOneWidget);

    await tester.tap(logInButton);
    await tester.pumpAndSettle();

    final navbar = find.byKey(const ValueKey('home_profile_header_key'));

    expect(navbar, findsOneWidget);

    final chart = find.byType(AppChart);

    // expect(navbar, findsOneWidget);
    expect(chart, findsOneWidget);
  });
}
