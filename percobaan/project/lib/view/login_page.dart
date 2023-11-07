import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:project/view/home_page.dart';
import 'package:provider/provider.dart';
import 'package:project/view_model/userprovider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController(); // Tambahkan controller untuk kata sandi
  
  Future<void> fetchData(BuildContext context) async{

    Map<String, dynamic> data = {
    'email': emailController.text,
    'password': passwordController.text,
  };

  String jsonData = json.encode(data);

    try {
    final response = await http.post(
    Uri.parse('http://192.168.43.216:5001/auth/login'),
    headers: {
      "Content-type": "application/json"
    },
    body: jsonData
  );

  if(response.statusCode == 200){
    final prefs = await SharedPreferences.getInstance();
      prefs.setString('data', response.body);
      // prefs.setString("password", passwordController.text);
      // final token = response.headers['authorization'];
      // prefs.setString("token", token);

      Navigator.pushNamed(context, '/Home');

  }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true, // Untuk menyembunyikan kata sandi
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  fetchData(context);
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}