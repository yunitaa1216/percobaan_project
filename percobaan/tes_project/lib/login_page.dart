import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tes_project/database.dart';
import 'package:firebase_core_web/firebase_core_web.dart';

// Future<void> delete() => handleThenable(DatabaseMethod().deleteApp());


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

Future<void> uploadData() async {
  Map<String, dynamic> uploaddata = {
    "Username": usernameController.text,
    "Email": emailController.text,
    "Password": passwordController.text,
  };

  await DatabaseMethod().addUserDetails(uploaddata);

  Fluttertoast.showToast(
    msg: "Data Uploaded Succsessfully",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

// Future<void> delete() => core_interop.deleteApp(jsObject);


Future<void> handleThenable(Future<dynamic> future) async {
  try {
    await future;
  } catch (error) {
    print(error);
  }
}

  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Username",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(237, 101, 67, 3),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.white60)
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
              height: 20.0,
            ),
              Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Email",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(237, 101, 67, 3),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white60)
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
              height: 20.0,
            ),
              Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Password",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(237, 101, 67, 3),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextField(
                  controller:passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white60)
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 90.0,
              ),
              GestureDetector(
                onTap: (){
                  uploadData();
                },
                child: Center(
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(22)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}