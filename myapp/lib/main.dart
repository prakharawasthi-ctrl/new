import 'package:flutter/material.dart';
import 'package:myapp/Screens/authPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // fontFamily: 'BeVietnamPro',
          appBarTheme: AppBarTheme(backgroundColor: Color(0xff792018))),
      home: AuthPage(),
    );
  }
}
