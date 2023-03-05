import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/theme_data.dart';
import 'package:instagram_clone/views/screens/auth/decider.dart';
import 'package:instagram_clone/views/screens/auth/signup.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      // home: const HomeScreen(),
      home: const DeciderScreen(), // decide whether go to home screen or pass through auth process
    );
  }
}
