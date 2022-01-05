// 1 - importe o package do mobx
import 'package:mobx/mobx.dart';

// 2 - adicione o NomeDoArquivo.g.dart que sera gerado automaticamente (`part` significado q a classe é dividida e sera somada no item 3)
part 'MainPageController.g.dart';

// 3 - adicione class NomeDoController = _NomeDoController with _$NomeDoController; (significa q vc esta gerando o NomeDoController sendo ele o _Nome.. que você ira criar no item 4 + _$Nome.. que é gerado automaticamente)
class MainPageController = _MainPageController with _$MainPageController;

// 4 - adicione absctract class _NomeDoController with Store e o preencha
abstract class _MainPageController with Store {
  // estado que pode ver observado (ver em MainPage.dart)
  @observable
  int screenIndex = 0;
  // ação que pode ser invocada (a ação é uma função, você pode fazer o que quiser dentro dela)
  @action
  setScreenIndex(int value) {
    screenIndex = value;
  }
}

// 5 - rode o comando `flutter packages pub run build_runner build --delete-conflicting-outputs` no terminal para gerar o arquivo automatico. Caso alguma alteração de estrutura seja feita (ex. criar uma nova action) é necessário rodar o comando novamente