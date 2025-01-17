import 'package:fidelidade_android/features/Profile/presentation/widgets/ProfileBody.dart';
import 'package:fidelidade_android/shared/presentation/widgets/ProfileEdit.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    void _submit() {}

    void _openProfileEditModal(context) {
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
            return ProfileEdit(formKey: _formKey, onSubmit: _submit);
          });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  _openProfileEditModal(context);
                },
                child: const Icon(
                  Icons.edit,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: ProfileBody(),
    );
  }
}
