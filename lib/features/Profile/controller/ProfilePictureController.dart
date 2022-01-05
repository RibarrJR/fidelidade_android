import 'dart:io';
import 'package:mobx/mobx.dart';

part 'ProfilePictureController.g.dart';

class ProfilePictureController = _ProfilePictureController
    with _$ProfilePictureController;

abstract class _ProfilePictureController with Store {
  @observable
  File? imageFile;

  @action
  setImageFile(File value) {
    imageFile = value;
  }
}
