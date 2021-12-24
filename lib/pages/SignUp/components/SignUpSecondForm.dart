import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:fidelidade_android/utils/Validators.dart';
import 'package:fidelidade_android/widget/LabelWithIconWidget.dart';

class _FormData {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController cep = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController number = TextEditingController();
}

class SecondForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onSubmit;

  SecondForm({Key? key, required this.formKey, required this.onSubmit})
      : super(key: key);

  @override
  State<SecondForm> createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {
  _FormData _form = _FormData();

  _fetchCep(cep) async {
    var url = Uri.https('viacep.com.br', '/ws/$cep/json/');
    http.Response response = await http.get(url);
    Map<String, dynamic> json =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    _form.state.text = json['uf'];
    _form.city.text = json['localidade'];
    _form.adress.text = json['logradouro'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => fieldRequired(value!),
                controller: _form.password,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Digite sua senha', labelText: 'Senha')),
            Container(
              height: 15,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    validateConfirmPassword(value!, _form.password.text),
                controller: _form.confirmPassword,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Confirme sua senha",
                    labelText: 'Confirmar Senha')),
            Container(
              height: 15,
            ),
            TextFormField(
                controller: _form.cep,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null) {
                    return null;
                  }
                  if (value.length == 9) {
                    _fetchCep(_form.cep.text);
                    return null;
                  } else {
                    return 'CEP INVALIDO';
                  }
                },
                inputFormatters: [
                  MaskTextInputFormatter(
                      mask: "#####-###", filter: {"#": RegExp(r'[0-9]')})
                ],
                decoration: const InputDecoration(
                    hintText: 'Digite seu CEP', labelText: 'CEP')),
            Container(
              height: 15,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => fieldRequired(value!),
                controller: _form.state,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Estado')),
            Container(
              height: 15,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => fieldRequired(value!),
                controller: _form.city,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Cidade')),
            Container(
              height: 15,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => fieldRequired(value!),
                controller: _form.adress,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Endereço')),
            Container(
              height: 15,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => fieldRequired(value!),
                controller: _form.number,
                decoration: const InputDecoration(labelText: 'Número')),
            Container(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LabelWithIcon(
                  icon: Icons.done,
                  label: 'Cadastrar',
                  onTap: widget.onSubmit,
                ),
              ],
            ),
            Container(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
