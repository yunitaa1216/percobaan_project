// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   List<Map<String, dynamic>> userData = [];
//   @override
//   void initState(){
//     super.initState();
//     fetchData();
//   }
  
//   void fetchData()async{
//     Dio dio = Dio();
//     String url = 'https://65373c7fbb226bb85dd2f77c.mockapi.io/users';
//     try {
//       //logic pemanggilan
//       Response response = await dio.get(url);
//       if (response.statusCode == 200){
//         setState(() {
//           userData = List<Map<String, dynamic>>.from(response.data);
//           print(userData);
//         });
//       } else{
//         print('Gagal mengambil data. Status code: ${response.statusCode}');
//       }
//     } catch (error){
//       print('Terjadi kesalahan: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Profil'),
//         ),
//         body: userData.isEmpty? Center(child: CircularProgressIndicator()) : 
//         ListView.builder(itemCount: userData.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: CircleAvatar(backgroundImage: NetworkImage(userData[index]['avatar']),),

//           );
//         },)
//       ),
//     );
//   }
// }