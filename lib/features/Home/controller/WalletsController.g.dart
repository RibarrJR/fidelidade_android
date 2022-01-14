// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WalletsController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletsController on _WalletsController, Store {
  final _$walletsModelAtom = Atom(name: '_WalletsController.walletsModel');

  @override
  WalletsModel? get walletsModel {
    _$walletsModelAtom.reportRead();
    return super.walletsModel;
  }

  @override
  set walletsModel(WalletsModel? value) {
    _$walletsModelAtom.reportWrite(value, super.walletsModel, () {
      super.walletsModel = value;
    });
  }

  final _$getWalletsAsyncAction = AsyncAction('_WalletsController.getWallets');

  @override
  Future getWallets() {
    return _$getWalletsAsyncAction.run(() => super.getWallets());
  }

  final _$_WalletsControllerActionController =
      ActionController(name: '_WalletsController');

  @override
  void setWallets(WalletsModel wallets) {
    final _$actionInfo = _$_WalletsControllerActionController.startAction(
        name: '_WalletsController.setWallets');
    try {
      return super.setWallets(wallets);
    } finally {
      _$_WalletsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
walletsModel: ${walletsModel}
    ''';
  }
}
