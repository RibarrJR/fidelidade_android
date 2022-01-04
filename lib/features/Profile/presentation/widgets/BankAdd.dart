import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:fidelidade_android/utils/Validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _FormData {
  TextEditingController type = TextEditingController();
  TextEditingController bank = TextEditingController();
  TextEditingController agency = TextEditingController();
  TextEditingController account = TextEditingController();
}

class BankAdd extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onSubmit;
  const BankAdd({Key? key, required this.formKey, required this.onSubmit})
      : super(key: key);

  @override
  State<BankAdd> createState() => _BankAddState();
}

class _BankAddState extends State<BankAdd> with TickerProviderStateMixin {
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
    String dropdownValue = 'Banco do Brasil';

    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            CustomAppBar(
              title: "Adicionar Banco",
              isOnmodal: true,
            ),
            TabBar(
              controller: _tabController,
              labelColor: kPrimaryColor,
              tabs: <Widget>[
                Tab(
                  text: "Pix",
                  icon: SvgPicture.asset("assets/images/pix.svg"),
                ),
                Tab(
                  text: "TED",
                  icon: SvgPicture.asset("assets/images/ted.svg"),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: _size.width * 0.70,
              height: _size.height * 0.60,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Wrap(
                    children: [
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _form.account,
                          validator: (value) => fieldRequired(value!),
                          decoration: const InputDecoration(
                              hintText: 'Digite a chave',
                              labelText: 'Chave Pix')),
                    ],
                  ),
                  Wrap(
                    children: [
                      Center(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: kPrimaryColor),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Banco do Brasil',
                            'NuBank',
                            'Itaú',
                            'Bradesco',
                            'Caixa Econômica'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: _size.height * 0.1),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _form.account,
                          validator: (value) => fieldRequired(value!),
                          decoration: const InputDecoration(
                              hintText: 'Digite a agência',
                              labelText: 'Agência')),
                      SizedBox(height: _size.height * 0.03),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _form.account,
                        validator: (value) => fieldRequired(value!),
                        decoration: const InputDecoration(
                            hintText: 'Digite a conta', labelText: 'Conta'),
                      ),
                    ],
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
                  'Adicionar',
                  style: TextStyle(color: gray),
                ),
              ),
            ),
            Container(
              width: _size.width * 0.73,
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                    enableFeedback: false,
                    shadowColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(kPrimaryLightColor),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: kPrimaryColor))),
                onPressed: () {},
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
