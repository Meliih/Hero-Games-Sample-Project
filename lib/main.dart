import 'package:deneme/homePage.dart';
import 'package:deneme/homePage2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => AppState();
}

class AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(fontSize: 17,
              fontWeight: FontWeight.w300,
              color: Colors.black
          ),
          bodyText2: const TextStyle(fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
         
          
        ),
      ),
      // home: HomePage(),
      home: HomePage2(),
      
    );
  }
}