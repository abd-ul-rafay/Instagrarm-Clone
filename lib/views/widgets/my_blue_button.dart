import 'package:flutter/material.dart';

class MyBlueButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const MyBlueButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text(text, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
      ),
    );
  }
}
