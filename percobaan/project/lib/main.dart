import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';
import 'package:project/view/login_page.dart';
import 'package:project/view_model/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:project/view/home_page.dart';
import 'package:project/view/chat_body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(), // Inisialisasi UserProvider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/Login',
        routes: {
          '/Login': (context) => LoginPage(),
          '/Home': (context) => HomePage(),
          '/chat': (context) => ChatPage(),
        },
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.amber,
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final userProvider = UserProvider();

//     return Provider<UserProvider>(
//       create: (context) => userProvider,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialRoute: '/Login',
//         routes: {
//   '/Login': (context) => LoginPage(),
//   '/Home': (context) => HomePage(), // Pastikan Anda sudah mendaftarkan rute '/Home' ke HomePage.
//   '/chat': (context) => ChatPage(),
// },
//         theme: ThemeData(
//           brightness: Brightness.light,
//           primarySwatch: Colors.amber,
//         ),
//       ),
//     );
//   }
// }