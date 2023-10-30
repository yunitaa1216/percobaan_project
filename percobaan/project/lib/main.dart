import 'package:project/detail_page.dart';
import 'package:project/home_page.dart';
import 'package:project/kos_list.dart';
import 'package:project/login_google_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/Login',
        routes: {
          // '/List':(context) => CoffeeShopList(),
          '/Login':(context) => LoginPage(),
          '/Home':(context) => HomePage(),
          '/Detail':(context) => DetailPage(),
        },
        theme: ThemeData(
            brightness: Brightness.light, primarySwatch: Colors.amber));
            
  }
}
