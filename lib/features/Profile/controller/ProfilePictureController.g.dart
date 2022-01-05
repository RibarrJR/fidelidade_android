// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfilePictureController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfilePictureController on _ProfilePictureController, Store {
  final _$imageFileAtom = Atom(name: '_ProfilePictureController.imageFile');

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$_ProfilePictureControllerActionController =
      ActionController(name: '_ProfilePictureController');

  @override
  dynamic setImageFile(File value) {
    final _$actionInfo = _$_ProfilePictureControllerActionController
        .startAction(name: '_ProfilePictureController.setImageFile');
    try {
      return super.setImageFile(value);
    } finally {
      _$_ProfilePictureControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageFile: ${imageFile}
    ''';
  }
}
