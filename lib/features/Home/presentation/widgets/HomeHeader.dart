import 'package:fidelidade_android/utils/constants.dart';
import 'package:fidelidade_android/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeHeader extends StatelessWidget with PreferredSizeWidget {
  final String name;
  final bool hasNotification;
  const HomeHeader({
    required this.name,
    required this.hasNotification,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: 10,
        backgroundColor: primaryColor,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Observer(builder: (context) {
                return Row(
                  key: const ValueKey("home_profile_header_key"),
                  children: <Widget>[
                    profilePictureController.imageFile == null
                        ? const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.account_circle,
                              size: 75,
                              color: Colors.white,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              backgroundImage: Image.file(
                                profilePictureController.imageFile!,
                              ).image,
                              radius: 32,
                            ),
                          ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Olá',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white)),
                        Text(name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                );
              }),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/notifications");
                },
                child: Stack(
                  children: [
                    const Icon(Icons.notifications,
                        color: Colors.white, size: 40),
                    Positioned(
                        right: 4,
                        top: 4,
                        child: Visibility(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: primaryColor, width: 2),
                                shape: BoxShape.circle,
                                color: Colors.green),
                          ),
                          visible: hasNotification,
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(125);
}
