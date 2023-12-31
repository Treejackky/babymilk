// ignore_for_file: prefer_const_constructors

import 'package:babymilk/views/calender/calendar.dart';
import 'package:babymilk/views/datababy/addbaby.dart';
import 'package:babymilk/views/datababy/addgrow.dart';
import 'package:babymilk/views/datababy/overview.dart';
import 'package:babymilk/views/home.dart';
import 'package:babymilk/views/viewsbaby/viewbaby.dart';
import 'package:babymilk/views/welcome.dart';
import 'package:flutter/material.dart';

Future main() async {
// Initialize FFI

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Color.fromARGB(255, 242, 238, 245);
    return MaterialApp(
      theme: ThemeData(
        //appbar theme
        appBarTheme: AppBarTheme(
          //center title
          centerTitle: true,
          backgroundColor: color,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        //body color
        scaffoldBackgroundColor: color,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/home': (context) => Home(),
        '/overview': (context) => Overview(),
        '/addbaby': (context) => AddBaby(),
        '/savegrowth': (context) => SaveGrowth(),
        '/viewbaby': (context) => ViewBaby(),
        '/calendar': (context) => Calendar(),
      },
    );
  }
}
