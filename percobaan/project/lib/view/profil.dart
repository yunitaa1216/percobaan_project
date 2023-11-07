import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String usetoken = "";


  @override
  void initState() {
    super.initState();
    loadDataFromApi();
    fetchData();
  }

  Future<void> loadDataFromApi() async {
  final prefs = await SharedPreferences.getInstance();
  final profil = prefs.getString('data');
  final data = json.decode(profil.toString());

  String token = data['token'];
  setState(() {
    usetoken = token;
  });
}

Future<void> fetchData() async{
  final response = await http.get(Uri.parse('http://192.168.43.216:5001/auth'), 
  headers: {
      'Authorization': 'Bearer $usetoken',
    },);
  print(response.body);
  print(usetoken);
}

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Profil Pengguna'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); // Kembali ke halaman sebelumnya
        },
      ),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50.0,
          ),
          SizedBox(height: 16.0),
        ],
      ),
    ),
  );
}
}