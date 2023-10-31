
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try{
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text, 
        password: _controllerPassword.text
        );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try{
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text, 
        password: _controllerPassword.text
        );
    } on FirebaseAuthException catch (e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title(){
    return const Text('Firebase Auth');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage(){
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton(){
    return ElevatedButton(
      onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword, 
      child: Text(isLogin? 'Login' : 'Register'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  // // Fungsi validasi sederhana untuk email
  // bool isEmailValid(String email) {
  //   // Anda dapat menambahkan logika validasi email yang sesuai dengan kebutuhan Anda di sini
  //   return email.contains('@');
  // }

  // // Fungsi validasi sederhana untuk kata sandi
  // bool isPasswordValid(String password) {
  //   // Anda dapat menambahkan logika validasi kata sandi yang sesuai dengan kebutuhan Anda di sini
  //   return password.length >= 6;
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Silakan login di sini',
//               style: TextStyle(fontSize: 18),
//             ),
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextFormField(
//               controller: passwordController,
//               obscureText: true, // Untuk menyembunyikan teks kata sandi
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Validasi input sebelum mengizinkan login
//                 final email = emailController.text;
//                 final password = passwordController.text;

//                 if (isEmailValid(email) && isPasswordValid(password)) {
//                   // Login berhasil, arahkan ke halaman Home
//                   Navigator.pushReplacementNamed(context, '/Home');
//                 } else {
//                   // Menampilkan pesan kesalahan jika validasi gagal
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Email atau kata sandi tidak valid.'),
//                     ),
//                   );
//                 }
//               },
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }