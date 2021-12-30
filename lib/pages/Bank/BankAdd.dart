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
    _tabController = TabController(length: 3, vsync: this);
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
              title: "Adicionar Banco",
              isOnmodal: true,
            ),
            TabBar(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  icon: Icon(Icons.cloud_outlined),
                ),
                Tab(
                  icon: Icon(Icons.beach_access_sharp),
                ),
                Tab(
                  icon: Icon(Icons.brightness_5_sharp),
                ),
              ],
            ),
            Container(
              width: _size.width,
              height: _size.height*0.75,
              color: Colors.red,
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  Center(
                    child: Text("It's cloudy here"),
                  ),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            )
            // DefaultTabController(
            //     length: 2,
            //     initialIndex: 0,
            //     child: Column(
            //       children: const [
            //         TabBar(
            //           tabs: [
            //             Tab(icon: Icon(Icons.directions_car)),
            //             Tab(icon: Icon(Icons.directions_transit)),
            //           ],
            //         ),
            //         Divider(
            //           height: 1,
            //           thickness: 1,
            //           indent: 20,
            //           endIndent: 20,
            //           color: kPrimaryColor,
            //         ),
            //         TabBarView(
            //           children: [
            //             Icon(Icons.directions_car),
            //             Icon(Icons.directions_transit),
            //           ],
            //         ),
            //       ],
            //     )),
            // Card(
            //   margin: const EdgeInsets.all(20),
            //   child: TextFormField(
            //       autovalidateMode: AutovalidateMode.onUserInteraction,
            //       controller: _form.account,
            //       validator: (value) => fieldRequired(value!),
            //       decoration: const InputDecoration(
            //           hintText: 'Digite a agência', labelText: 'Agência')),
            // ),
            // Container(
            //   margin: const EdgeInsets.all(20),
            //   child: TextFormField(
            //     autovalidateMode: AutovalidateMode.onUserInteraction,
            //     controller: _form.account,
            //     validator: (value) => fieldRequired(value!),
            //     decoration: const InputDecoration(
            //         hintText: 'Digite a conta', labelText: 'Conta'),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(bottom: 10),
            //   child: ElevatedButton(
            //     style: ButtonStyle(
            //       enableFeedback: false,
            //       shadowColor: MaterialStateProperty.all(Colors.white),
            //       backgroundColor: MaterialStateProperty.all(disabledBg),
            //     ),
            //     onPressed: () {},
            //     child: const Text(
            //       'Adicionar',
            //       style: TextStyle(color: gray),
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(bottom: 10),
            //   child: ElevatedButton(
            //     style: ButtonStyle(
            //         enableFeedback: false,
            //         shadowColor: MaterialStateProperty.all(Colors.white),
            //         backgroundColor:
            //             MaterialStateProperty.all(kPrimaryLightColor),
            //         side: MaterialStateProperty.all(
            //             const BorderSide(color: kPrimaryColor))),
            //     onPressed: () {},
            //     child: const Text(
            //       'Cancelar',
            //       style: TextStyle(color: kPrimaryColor),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
