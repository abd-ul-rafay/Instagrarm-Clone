import 'package:flutter/material.dart';

void showDialogBox(BuildContext context, String e) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(e),
        );
      }
  );
}
