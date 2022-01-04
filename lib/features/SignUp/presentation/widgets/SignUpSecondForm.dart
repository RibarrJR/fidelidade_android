import 'package:fidelidade_android/shared/presentation/widgets/Input.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:fidelidade_android/utils/Validators.dart';
import 'package:fidelidade_android/shared/presentation/widgets/LabelWithIconWidget.dart';

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
  final void Function(_FormData form) onSubmit;

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
            Input(
              obscureText: true,
              controller: _form.password,
              hintText: 'Digite sua senha',
              labelText: 'Senha',
              validator: (value) => fieldRequired(value!),
            ),
            Container(
              height: 15,
            ),
            Input(
              obscureText: true,
              controller: _form.confirmPassword,
              hintText: 'Confirme sua senha',
              labelText: 'Confirmar Senha',
              validator: (value) =>
                  validateConfirmPassword(value!, _form.password.text),
            ),
            Container(
              height: 15,
            ),
            Input(
              keyboardType: TextInputType.number,
              controller: _form.cep,
              hintText: 'Digite seu CEP',
              labelText: 'CEP',
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
            ),
            Container(
              height: 15,
            ),
            Input(
              readOnly: true,
              controller: _form.state,
              labelText: 'Estado',
              validator: (value) => fieldRequired(value!),
            ),
            Container(
              height: 15,
            ),
            Input(
              readOnly: true,
              controller: _form.city,
              labelText: 'Cidade',
              validator: (value) => fieldRequired(value!),
            ),
            Container(
              height: 15,
            ),
            Input(
              readOnly: true,
              controller: _form.adress,
              labelText: 'Endereço',
              validator: (value) => fieldRequired(value!),
            ),
            Container(
              height: 15,
            ),
            Input(
              controller: _form.number,
              labelText: 'Número',
              validator: (value) => fieldRequired(value!),
            ),
            Container(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LabelWithIcon(
                  icon: Icons.done,
                  label: 'Cadastrar',
                  onTap: () => widget.onSubmit(_form),
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
