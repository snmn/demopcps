import 'package:demopcps/routes.dart';
import 'package:demopcps/views/chatapp/conversations.dart';
import 'package:demopcps/views/esewatest/esewa.dart';
import 'package:demopcps/views/maps/mapspage.dart';
import 'package:demopcps/views/news/dashboard.dart';
import 'package:demopcps/views/news/gridviewdashboard.dart';
import 'package:demopcps/views/webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demopcps/firebase_options.dart';
Future<void> main()  async {
    WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: AppRoute.loginpageroute,
      routes: AppRoute.getAppRoutes(),
    );
  }
}




