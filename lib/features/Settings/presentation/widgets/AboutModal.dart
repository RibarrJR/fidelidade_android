import 'package:fidelidade_android/shared/presentation/widgets/CustomAppBar.dart';
import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';

class AboutModal extends StatelessWidget {
  const AboutModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: "+Fidelidade",
          isOnmodal: true,
        ),
        const SizedBox(height: 20),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                'Maecenas molestie ultrices velit eget facilisis. Pellentesque' 
                'eu euismod ante, at varius nunc. Aliquam a metus tortor. Fusce'
                'id ligula eu eros pulvinar imperdiet vel eget mauris. Fusce '
                'feugiat risus mauris, quis pretium arcu gravida at.',
                style: TextStyle(color: kPrimaryColor, fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(              
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Versão - 1.0.0',
                  style: TextStyle(color: gray, fontSize: 16.0),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }
}
