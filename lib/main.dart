import 'package:demopcps/dashboard.dart';
import 'package:demopcps/demoA.dart';
import 'package:demopcps/democlass1.dart';
import 'package:demopcps/democlass2.dart';
import 'package:demopcps/login.dart';
import 'package:demopcps/loginpage.dart';
import 'package:demopcps/signinpage.dart';
import 'package:flutter/material.dart';
import 'demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PCPS DEMO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  dashboard(),
    );
  }
}




