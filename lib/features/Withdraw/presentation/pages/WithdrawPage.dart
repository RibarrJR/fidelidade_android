import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final btnStyle = TextButton.styleFrom(
      padding: EdgeInsets.all(size.height * 0.07),
      backgroundColor: disabledBg,
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sacar',
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomTextButtonImage(
              text: 'Pix',
              style: btnStyle,
              press: () {
                Navigator.pushNamed(context, '/pix');
              },
              image: SvgPicture.asset(
                "assets/images/pix.svg",
                width: 42,
                height: 42,
              ),
            ),
            const CustomDivider(
              text: 'Ou',
            ),
            CustomTextButtonImage(
              text: 'Ted',
              style: btnStyle,
              press: () {
                Navigator.pushNamed(context, '/ted');
              },
              image: SvgPicture.asset(
                "assets/images/ted.svg",
                width: 42,
                height: 42,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButtonImage extends StatelessWidget {
  final SvgPicture image;
  final String text;
  final VoidCallback press;
  final ButtonStyle style;

  const CustomTextButtonImage({
    Key? key,
    required this.text,
    required this.image,
    required this.press,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: newTextButton(),
      ),
    );
  }

  Widget newTextButton() {
    return TextButton(
      onPressed: press,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 10.0,
            ),
            image,
          ]),
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          backgroundColor: disabledBg,
          textStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800)),
    );
  }
}

class CustomDivider extends StatelessWidget {
  final String text;

  const CustomDivider({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            color: primaryColor,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            height: 30,
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        const Expanded(
          child: Divider(
            color: primaryColor,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            height: 30,
          ),
        ),
      ],
    );
  }
}
