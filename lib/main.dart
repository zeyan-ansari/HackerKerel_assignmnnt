// @dart=2.9
import 'package:assignment/dashboard.dart';
import 'package:assignment/splashscreen.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
