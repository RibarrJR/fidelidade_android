import 'package:fidelidade_android/constants.dart';
import 'package:flutter/material.dart';

class PixCardWidget extends StatelessWidget {
  final String type;
  final String value;

  const PixCardWidget({
    Key? key,
    required this.type,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/withdraw/value");
      },
      child: Card(
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 30.0),
                child: Icon(
                  Icons.vpn_key_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(type,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26)),
                    ],
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Chave: ",
                          style: TextStyle(
                              color: purpleColor, fontWeight: FontWeight.bold)),
                      Text(value,
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
