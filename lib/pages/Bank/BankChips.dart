import 'package:fidelidade_android/constants.dart';
import 'package:fidelidade_android/pages/Bank/BankAdd.dart';
import 'package:flutter/material.dart';

class BankChips extends StatefulWidget {
  const BankChips({Key? key}) : super(key: key);

  @override
  _BankChipsState createState() => _BankChipsState();
}

class _BankChipsState extends State<BankChips> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _submit() {}
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Chip(
        label: Text('Banco do Brasil'),
        deleteIcon: Icon(Icons.cancel),
        backgroundColor: kPrimaryColor,
        labelPadding: EdgeInsets.only(top: 13, bottom: 13, left: 10),
        labelStyle: TextStyle(color: kPrimaryLightColor),
        deleteIconColor: kPrimaryLightColor,
        onDeleted: () {},
      ),
      Chip(
        label: TextButton(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(color: kPrimaryColor)),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
          ),
          onPressed: () {
            showGeneralDialog(
              barrierLabel: "Label",
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: Duration(milliseconds: 700),
              context: context,
              pageBuilder: (context, anim1, anim2) {
                var size = MediaQuery.of(context).size;
                return Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: size.height,
                    child: BankAdd(
                      formKey: _formKey,
                      onSubmit: _submit,
                    ),
                    margin: const EdgeInsets.only(
                        top: 50, left: 12, right: 12, bottom: 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                  ),
                );
              },
              transitionBuilder: (context, anim1, anim2, child) {
                return SlideTransition(
                  position: Tween(begin: Offset(0, 0), end: Offset(0, 0))
                      .animate(anim1),
                  child: child,
                );
              },
            );
          },
          child: Text('Novo Banco'),
        ),
        deleteIcon: Icon(Icons.add),
        deleteIconColor: kPrimaryColor,
        backgroundColor: kPrimaryLightColor,
        labelStyle: TextStyle(color: kPrimaryLightColor),
        side: BorderSide(width: 1.5, color: kPrimaryColor),
        onDeleted: () {},
      ),
    ]);
  }
}
