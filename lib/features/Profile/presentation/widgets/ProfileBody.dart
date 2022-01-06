import 'package:fidelidade_android/features/Profile/presentation/widgets/ChangePassword.dart';
import 'package:fidelidade_android/features/Profile/presentation/widgets/BankChips.dart';
import 'package:fidelidade_android/features/Profile/presentation/widgets/ProfileBackground.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:fidelidade_android/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fidelidade_android/utils/Alerts.dart';
import 'dart:io';

enum ImageSourceType { gallery, camera }

class ProfileBody extends StatefulWidget {
  ProfileBody({Key? key}) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late PopupMenu menu;
  GlobalKey btnKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    menu = PopupMenu(items: [
      // MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
      // MenuItem(title: 'Home', image: Icon(Icons.home, color: Colors.white,)),
      MenuItem(
        title: 'Câmera',
        image: const Icon(
          Icons.photo_camera,
          color: Colors.white,
        ),
      ),
      MenuItem(
          title: 'Álbum',
          image: const Icon(
            Icons.photo_album,
            color: Colors.white,
          )),
    ], onClickMenu: onClickMenu, onDismiss: onDismiss, maxColumn: 2);
  }

  void onClickMenu(MenuItemProvider item) async {
    XFile? picture;
    switch (item.menuTitle) {
      case 'Câmera':
        picture = await ImagePicker().pickImage(source: ImageSource.camera);
        break;
      case 'Álbum':
        picture = await ImagePicker().pickImage(source: ImageSource.gallery);
        break;
      default:
    }

    if (picture != null) {
      profilePictureController.setImageFile(File(picture.path));
    }
  }

  void stateChanged(bool isShow) {
    print('menu is ${isShow ? 'showing' : 'closed'}');
  }

  void onDismiss() {
    print('Menu is dismiss');
  }

  @override
  Widget build(BuildContext context) {
    PopupMenu.context = context;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    void _submit() {}

    void _openChangePasswordModal(context) {
      final Size _size = MediaQuery.of(context).size;
      showModalBottomSheet(
          isScrollControlled: true,
          constraints: BoxConstraints(
              maxWidth: _size.width * 0.9, minHeight: _size.height * 0.95),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          context: context,
          builder: (BuildContext bc) {
            return ChangePassword(formKey: _formKey, onSubmit: _submit);
          });
    }

    return Column(children: [
      Observer(builder: (context) {
        return ProfileBackground(
          imageFile: profilePictureController.imageFile,
          child: Padding(
            padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        profilePictureController.imageFile == null
                            ? const Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 128,
                              )
                            : CircleAvatar(
                                backgroundImage: Image.file(
                                  profilePictureController.imageFile!,
                                ).image,
                              ),
                        Positioned(
                            bottom: 0,
                            right: -25,
                            child: RawMaterialButton(
                              key: btnKey,
                              onPressed: () {
                                menu.show(widgetKey: btnKey);
                              },
                              elevation: 2.0,
                              fillColor: const Color(0xFFF5F6F9),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.blue,
                              ),
                              padding: const EdgeInsets.all(15.0),
                              shape: const CircleBorder(),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Eder Taveira",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "28/02/1983",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.phone_android,
                            color: Colors.white, size: 18),
                      ),
                    ),
                    TextSpan(
                        text: "+55 61 98250-0159",
                        style: TextStyle(color: Colors.white, fontSize: 18.0))
                  ])),
                ),
                const SizedBox(height: 5.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child:
                              Icon(Icons.email, color: Colors.white, size: 18)),
                    ),
                    TextSpan(
                        text: "edertaveira@gmail.com",
                        style: TextStyle(color: Colors.white, fontSize: 18.0))
                  ])),
                ),
                const SizedBox(height: 5.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.location_on,
                              color: Colors.white, size: 18)),
                    ),
                    TextSpan(
                        text: "Brasília-DF",
                        style: TextStyle(color: Colors.white, fontSize: 18.0))
                  ])),
                )
              ],
            ),
          ),
        );
      }),
      GestureDetector(
        onTap: () {
          _openChangePasswordModal(context);
        },
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(children: <InlineSpan>[
                WidgetSpan(
                  child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child:
                          Icon(Icons.password, color: kPrimaryColor, size: 18)),
                ),
                TextSpan(
                    text: "Alterar Senha",
                    style: TextStyle(color: kPrimaryColor, fontSize: 18.0))
              ]),
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(TextSpan(children: <InlineSpan>[
            WidgetSpan(
              child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.account_balance,
                      color: kPrimaryColor, size: 18)),
            ),
            TextSpan(
                text: "Lista de Bancos",
                style: TextStyle(color: kPrimaryColor, fontSize: 18.0))
          ])),
        ),
      ),
      const BankChips(),
      GestureDetector(
        onTap: () {
          showAlertDialog(context, "Confirmação",
              "Gostaria de confirmar a Finalização da sessão?");
        },
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.logout, color: kPrimaryColor, size: 18)),
              ),
              TextSpan(
                  text: "Finalizar Sessão",
                  style: TextStyle(color: kPrimaryColor, fontSize: 18.0))
            ])),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          showAlertDialog(
              context, "Confirmação", "Gostaria de confirmar apagar a conta?");
        },
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child:
                        Icon(Icons.power_off, color: kPrimaryColor, size: 18)),
              ),
              TextSpan(
                  text: "Apagar Conta",
                  style: TextStyle(color: Colors.red, fontSize: 18.0))
            ])),
          ),
        ),
      ),
    ]);
  }
}
