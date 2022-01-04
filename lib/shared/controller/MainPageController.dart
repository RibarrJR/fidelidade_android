import 'package:mobx/mobx.dart';

part 'MainPageController.g.dart';

class MainPageController = _MainPageController with _$MainPageController;

abstract class _MainPageController with Store {
  @observable
  int screenIndex = 0;

  @action
  setScreenIndex(int value) {
    screenIndex = value;
  }
}
