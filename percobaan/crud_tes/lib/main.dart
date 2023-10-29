import 'package:crud_tes/detail_page.dart';
import 'package:crud_tes/home_page.dart';
import 'package:crud_tes/kos_list.dart';
import 'package:crud_tes/login_user.dart';
// import 'package:project/login_google_page.dart';
import 'package:flutter/material.dart';
import 'package:crud_tes/login_user.dart';

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
          // '/Login':(context) => LoginPage(),
          // '/List':(context) => CoffeeShopList(),
          '/Home':(context) => HomePage(),
          '/Detail':(context) => DetailPage(),
        },
        theme: ThemeData(
            brightness: Brightness.light, primarySwatch: Colors.amber));
            
  }
}
