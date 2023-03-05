import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: SvgPicture.asset(
        (MediaQuery.of(context).platformBrightness == Brightness.light) ?
        'assets/icons/instagram_name_lighttheme.svg' : 'assets/icons/instagram_name_darktheme.svg',
        height: 45.0,
      ),
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          icon: Icon(Icons.messenger_outline_outlined,
            color: (MediaQuery.of(context).platformBrightness == Brightness.light)?
              Colors.black : Colors.white,
          ),
        )
      ],
    );
  }
}
