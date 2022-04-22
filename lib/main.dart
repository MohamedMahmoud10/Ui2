import 'package:flutter/material.dart';
import 'package:updatedui2/PageView.dart';
import 'package:updatedui2/TextFormField1.dart';
import 'splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs =  await SharedPreferences.getInstance();
 bool? descion = _prefs.getBool('x') ;
Widget _screen=(descion==null||descion==false)? PgaeView():MyApp();
  runApp(_screen);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title:  Text('Welcome'),

        ),
      ) ,

    );
  }
}
