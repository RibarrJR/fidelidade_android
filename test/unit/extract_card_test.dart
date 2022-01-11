import 'package:fidelidade_android/features/Extract/presentation/pages/ExtractPage.dart';
import 'package:fidelidade_android/features/Extract/presentation/widgets/ExtractCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const date = '10/10/2020';
const amount = '200';

void main() {
  group('Extratos :', () {
    test(
        'Quando criar uma instância de um card de extratos do tipo recebimento deve verificar se a mensagem e o icone estão corretos',
        () {
      final extractCard = extractCardFactory(CardType.RECEIVE);
      expect(extractCard.text, "Você recebeu: $amount moedas");
      expect(extractCard.icon, Icons.paid);
    });
    test(
        'Quando criar uma instância de um card de extratos do tipo transferir deve verificar se a mensagem e o icone estão corretos',
        () {
      final extractCard = extractCardFactory(CardType.TRANSFER);
      expect(extractCard.text, "Você transferiu: $amount");
      expect(extractCard.icon, Icons.swap_horizontal_circle);
    });
    test(
        'Quando criar uma instância de um card de extratos do tipo sacar deve verificar se a mensagem e o icone estão corretos',
        () {
      final extractCard = extractCardFactory(CardType.WITHDRAW);
      expect(extractCard.text, "Você sacou: $amount");
      expect(extractCard.icon, Icons.outbond);
    });
  });
}

ExtractCard extractCardFactory(CardType type) {
  return ExtractCard(type: type, amount: amount, date: date);
}
