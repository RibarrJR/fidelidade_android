import 'package:fidelidade_android/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool? automaticallyImplyLeading;
  bool isOnmodal;
  CustomAppBar(
      {Key? key,
      required this.title,
      this.automaticallyImplyLeading,
      this.isOnmodal = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 50, bottom: 16),
      child: AppBar(
        elevation: 1,
        automaticallyImplyLeading: automaticallyImplyLeading ?? false,
        shadowColor: Colors.transparent,
        backgroundColor: primaryColor,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 36),
        ),
        centerTitle: !isOnmodal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        toolbarHeight: isOnmodal ? 54 : 84,
      ),
    );
  }

  @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Size get preferredSize => Size.fromHeight(isOnmodal ? 54 : 84);
}
