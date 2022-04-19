import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'main.dart';
class SplashScreenDart extends StatelessWidget {
  const SplashScreenDart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: const  MyApp() ,
        duration:2 ,
        imageSrc:'8K.jpg',
        imageSize:50 ,
        text: 'Loading',
        backgroundColor: Colors.blue,
      ),
    );
  }
}
