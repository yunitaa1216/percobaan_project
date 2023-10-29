import 'package:tes_project/detail_page.dart';
import 'package:tes_project/home_page.dart';
import 'package:tes_project/kos_list.dart';
import 'package:tes_project/login_google_page.dart';
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
        initialRoute: '/Home',
        routes: {
          // '/List':(context) => CoffeeShopList(),
          '/Home':(context) => HomePage(),
          '/Detail':(context) => DetailPage(),
        },
        theme: ThemeData(
            brightness: Brightness.light, primarySwatch: Colors.amber));
            
  }
}
