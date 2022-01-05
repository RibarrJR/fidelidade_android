// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainPageController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainPageController on _MainPageController, Store {
  final _$screenIndexAtom = Atom(name: '_MainPageController.screenIndex');

  @override
  int get screenIndex {
    _$screenIndexAtom.reportRead();
    return super.screenIndex;
  }

  @override
  set screenIndex(int value) {
    _$screenIndexAtom.reportWrite(value, super.screenIndex, () {
      super.screenIndex = value;
    });
  }

  final _$_MainPageControllerActionController =
      ActionController(name: '_MainPageController');

  @override
  dynamic setScreenIndex(int value) {
    final _$actionInfo = _$_MainPageControllerActionController.startAction(
        name: '_MainPageController.setScreenIndex');
    try {
      return super.setScreenIndex(value);
    } finally {
      _$_MainPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screenIndex: ${screenIndex}
    ''';
  }
}
