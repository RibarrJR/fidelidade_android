import 'package:fidelidade_android/components/CustomAppBar.dart';
import 'package:fidelidade_android/constants.dart';
import 'package:fidelidade_android/utils/Validators.dart';
import 'package:flutter/material.dart';

class _FormData {
  TextEditingController type = TextEditingController();
  TextEditingController bank = TextEditingController();
  TextEditingController agency = TextEditingController();
  TextEditingController account = TextEditingController();
}

class BankAdd extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onSubmit;
  BankAdd({Key? key, required this.formKey, required this.onSubmit})
      : super(key: key);

  final _FormData _form = _FormData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomAppBar(title: "Adicionar Banco"),
          Divider(
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: kPrimaryColor,
          ),
          Card(
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _form.account,
                validator: (value) => fieldRequired(value!),
                decoration: InputDecoration(
                    hintText: 'Digite a agência', labelText: 'Agência')),
          ),
          Card(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _form.account,
              validator: (value) => fieldRequired(value!),
              decoration: InputDecoration(
                  hintText: 'Digite a conta', labelText: 'Conta'),
            ),
          ),
        ],
      ),
    );
  }
}
