import 'package:fidelidade_android/features/Profile/presentation/widgets/BankAdd.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class BankChips extends StatefulWidget {
  const BankChips({Key? key}) : super(key: key);

  @override
  _BankChipsState createState() => _BankChipsState();
}

class _BankChipsState extends State<BankChips> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _submit() {}

  void _openBankAddModal(context) {
    final Size _size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        constraints: BoxConstraints(
            maxWidth: _size.width * 0.8, minHeight: _size.height * 0.95),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return BankAdd(formKey: _formKey, onSubmit: _submit);
        });
  }

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
            _openBankAddModal(context);
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
