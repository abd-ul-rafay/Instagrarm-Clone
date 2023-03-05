import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Expanded(child: Divider(thickness: 1,)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text('OR'),
        ),
        Expanded(child: Divider(thickness: 1,)),
      ],
    );
  }
}
