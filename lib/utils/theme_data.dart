import 'package:flutter/material.dart';
import 'consts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: myWhite,
      appBarTheme: const AppBarTheme(
        backgroundColor: myWhite,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: myWhite,
        selectedIconTheme: IconThemeData(color: myBlack),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
      )
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: myBlack,
      appBarTheme: const AppBarTheme(
        backgroundColor: myBlack,
        iconTheme: IconThemeData(
            color: myWhite
        ),
      ),
      iconTheme: const IconThemeData(
          color: myWhite
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: myBlack,
        selectedIconTheme: IconThemeData(color: myWhite),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
      ),
    );
  }
}
