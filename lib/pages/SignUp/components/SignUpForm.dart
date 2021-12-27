import 'package:fidelidade_android/components/Input.dart';
import 'package:fidelidade_android/constants.dart';
import 'package:fidelidade_android/utils/Validators.dart';
import 'package:fidelidade_android/widget/LabelWithIconWidget.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class _FormData {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cpf = TextEditingController();
}

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onSubmit;

  SignUpForm({Key? key, required this.formKey, required this.onSubmit})
      : super(key: key);

  final _FormData _form = _FormData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Input(
              controller: _form.name,
              hintText: 'Digite seu nome completo',
              labelText: 'Nome Completo',
              validator: (value) => fieldRequired(value!),
            ),
            Container(
              height: 15,
            ),
            Input(
              controller: _form.email,
              hintText: 'Digite seu melhor email',
              labelText: 'E-mail',
              validator: (value) => emailValidator(value!),
            ),
            Container(
              height: 15,
            ),
            Input(
              controller: _form.cpf,
              hintText: 'Digite seu CPF',
              labelText: 'CPF',
              validator: (value) => cpfValidator(value!),
              inputFormatters: [
                  MaskTextInputFormatter(
                      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')})
                ]
            ),
            Container(
              height: 60,
            ),
            LabelWithIcon(
              icon: Icons.arrow_forward,
              label: 'Proximo',
              onTap: onSubmit,
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
