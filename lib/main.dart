import 'package:flutter/material.dart';
import 'package:updatedui2/TextFormField1.dart';
import 'splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const   MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashScreenDart(),

    );
  }
}
