import 'package:get_it/get_it.dart';

import 'package:fidelidade_android/shared/controller/MainPageController.dart';
import 'package:fidelidade_android/features/Profile/controller/ProfilePictureController.dart';

// Essa etapa é só um facilitador
// Pra que não seja necessário usar GetIt.I<MainPageController>() nas ações do controller (ex. GetIt.I<MainPageController>().setScreenIndex(index)) a variavel global abaixo é gerada (ex. mainPageController.setScreenIndex(index))

// MobX Controllers
final mainPageController = GetIt.I<MainPageController>();
final profilePictureController = GetIt.I<ProfilePictureController>();
