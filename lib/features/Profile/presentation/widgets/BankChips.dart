import 'package:fidelidade_android/features/Profile/presentation/widgets/BankAdd.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fidelidade_android/utils/Alerts.dart';

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
            maxWidth: _size.width * 0.9, minHeight: _size.height * 0.95),
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
          label: const Text('Banco do Brasil'),
          deleteIcon: const Icon(Icons.cancel),
          backgroundColor: kPrimaryColor,
          labelPadding: const EdgeInsets.only(top: 13, bottom: 13, left: 10),
          labelStyle: const TextStyle(color: kPrimaryLightColor),
          deleteIconColor: kPrimaryLightColor,
          onDeleted: () {
            showAlertDialog(
                context, "Deletar Banco", "Deseja confirmar a exclusão?");
          }),
      Chip(
        label: TextButton(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(color: kPrimaryColor)),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
          ),
          onPressed: () {
            _openBankAddModal(context);
          },
          child: const Text('Novo Banco'),
        ),
        deleteIcon: const Icon(Icons.add),
        deleteIconColor: kPrimaryColor,
        backgroundColor: kPrimaryLightColor,
        labelStyle: const TextStyle(color: kPrimaryLightColor),
        side: const BorderSide(width: 1.5, color: kPrimaryColor),
        onDeleted: () {},
      ),
    ]);
  }
}
