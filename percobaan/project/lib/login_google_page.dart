// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project/auth.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   LoginPage({Key? key}) : super(key: key);

//   final User? user = Auth().currentUser;

//   Future<void> signOut() async {
//     await Auth().signOut();
//   }

//   Widget _title(){
//     return const Text('Firebase auth');
//   }

//   Widget _userUid(){
//     return Text(user?.email ?? 'user email');
//   }

//   Widget _signOutButton(){
//     return ElevatedButton(
//       onPressed: signOut, 
//       child: const Text('Sign Out'),
//       );
//   }

//   @override
//   Widget build (BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: _title(),
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _userUid(),
//             _signOutButton()
//           ],
//         ),
//       ),
//     );
//   }
// }
//   // final TextEditingController emailController = TextEditingController();
//   // final TextEditingController passwordController = TextEditingController();

//   // // Fungsi validasi sederhana untuk email
//   // bool isEmailValid(String email) {
//   //   // Anda dapat menambahkan logika validasi email yang sesuai dengan kebutuhan Anda di sini
//   //   return email.contains('@');
//   // }

//   // // Fungsi validasi sederhana untuk kata sandi
//   // bool isPasswordValid(String password) {
//   //   // Anda dapat menambahkan logika validasi kata sandi yang sesuai dengan kebutuhan Anda di sini
//   //   return password.length >= 6;
//   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Login Page'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               'Silakan login di sini',
// //               style: TextStyle(fontSize: 18),
// //             ),
// //             TextFormField(
// //               controller: emailController,
// //               decoration: InputDecoration(labelText: 'Email'),
// //             ),
// //             TextFormField(
// //               controller: passwordController,
// //               obscureText: true, // Untuk menyembunyikan teks kata sandi
// //               decoration: InputDecoration(labelText: 'Password'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Validasi input sebelum mengizinkan login
// //                 final email = emailController.text;
// //                 final password = passwordController.text;

// //                 if (isEmailValid(email) && isPasswordValid(password)) {
// //                   // Login berhasil, arahkan ke halaman Home
// //                   Navigator.pushReplacementNamed(context, '/Home');
// //                 } else {
// //                   // Menampilkan pesan kesalahan jika validasi gagal
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(
// //                       content: Text('Email atau kata sandi tidak valid.'),
// //                     ),
// //                   );
// //                 }
// //               },
// //               child: Text('Login'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi validasi sederhana untuk email
  bool isEmailValid(String email) {
    // Anda dapat menambahkan logika validasi email yang sesuai dengan kebutuhan Anda di sini
    return email.contains('@');
  }

  // Fungsi validasi sederhana untuk kata sandi
  bool isPasswordValid(String password) {
    // Anda dapat menambahkan logika validasi kata sandi yang sesuai dengan kebutuhan Anda di sini
    return password.length >= 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Silakan login di sini',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true, // Untuk menyembunyikan teks kata sandi
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: () {
                // Validasi input sebelum mengizinkan login
                final email = emailController.text;
                final password = passwordController.text;

                if (isEmailValid(email) && isPasswordValid(password)) {
                  // Login berhasil, arahkan ke halaman Home
                  Navigator.pushReplacementNamed(context, '/Home');
                } else {
                  // Menampilkan pesan kesalahan jika validasi gagal
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Email atau kata sandi tidak valid.'),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}