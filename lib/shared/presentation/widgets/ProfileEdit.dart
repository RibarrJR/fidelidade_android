import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/shared/presentation/widgets/RoundedPasswordField.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class _FormData {
  TextEditingController type = TextEditingController();
  TextEditingController bank = TextEditingController();
  TextEditingController agency = TextEditingController();
  TextEditingController account = TextEditingController();
}

class ChangePassword extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onSubmit;
  const ChangePassword(
      {Key? key, required this.formKey, required this.onSubmit})
      : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>
    with TickerProviderStateMixin {
  final _FormData _form = _FormData();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            CustomAppBar(
              title: "Alterar Senha",
              isOnmodal: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: _size.width * 0.70,
              height: _size.height * 0.60,
              child: Wrap(
                children: [
                  SizedBox(height: _size.height * 0.1),
                  RoundedPasswordField(
                    hintText: "Senha Atual",
                    onChanged: (value) {},
                  ),
                  SizedBox(height: _size.height * 0.03),
                  RoundedPasswordField(
                    hintText: "Nova Senha",
                    onChanged: (value) {},
                  ),
                  SizedBox(height: _size.height * 0.03),
                  RoundedPasswordField(
                    hintText: "Confirmar Senha",
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            Container(
              width: _size.width * 0.73,
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  enableFeedback: false,
                  shadowColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(disabledBg),
                ),
                onPressed: () {},
                child: const Text(
                  'Alterar',
                  style: TextStyle(color: gray),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
