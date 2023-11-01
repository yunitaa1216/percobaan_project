import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/view_model/userprovider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController(); // Tambahkan controller untuk kata sandi

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
  final email = emailController.text;
  final password = passwordController.text;

  if (isEmailValid(email) && isPasswordValid(password)) {
    // Login berhasil, simpan data pengguna dengan provider
    Provider.of<UserProvider>(context, listen: false).loginUser(email, password);

    // Arahkan ke halaman Home
    Navigator.pushReplacementNamed(context, '/Home');
  } else {
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

  bool isEmailValid(String email) {
    return email.contains('@');
  }

  bool isPasswordValid(String password) {
    return password.length >= 6;
  }
}