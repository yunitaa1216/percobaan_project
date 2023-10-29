import 'package:firebase_core/firebase_core.dart';
import 'package:tes_project/detail_page.dart';
import 'package:tes_project/home_page.dart';
// import 'package:tes_project/login_page.dart';
import 'package:flutter/material.dart';
// import 'package:tes_project/login_page.dart';

// import 'database.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: LoginPage(),
        home: HomePage(),
        theme: ThemeData(
            brightness: Brightness.light, primarySwatch: Colors.amber));
  }
}