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
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _form.name,
                validator: (value) => fieldRequired(value!),
                decoration: new InputDecoration(
                    hintText: 'Digite seu nome completo',
                    labelText: 'Nome Completo')),
            Container(
              height: 15,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => emailValidator(value!),
                controller: _form.email,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                    hintText: 'Digite seu melhor email', labelText: 'E-mail')),
            Container(
              height: 15,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => cpfValidator(value!),
                controller: _form.cpf,
                inputFormatters: [
                  MaskTextInputFormatter(
                      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')})
                ],
                decoration: new InputDecoration(
                    hintText: 'Digite seu CPF', labelText: 'CPF')),
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
