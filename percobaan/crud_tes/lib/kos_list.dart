import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CoffeeShopDetail extends StatelessWidget {
  final String imagePath;
  final String nameShop;
  final String harga;
  final String fasilitas;
  final String phoneNumber;

  CoffeeShopDetail({
    required this.imagePath,
    required this.nameShop,
    required this.harga,
    required this.fasilitas,
    required this.phoneNumber,
  });

  TextEditingController textFieldController = TextEditingController(); // Ini adalah controller untuk TextField.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _response = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameShop),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath),
            Text(nameShop),
            Text("Harga: $harga"),
            Text("Fasilitas: $fasilitas"),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Telepon pemilik kos
                launch('whatsapp://send?phone=$phoneNumber');
              },
              child: Text("Telepon Pemilik Kos"),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: textFieldController,
                decoration: InputDecoration(
                  labelText: 'Contoh Textfield',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed:(){}, 
              child: Text('Submit')),
              SizedBox(height: 16.0),
              Text('Response : ')
          ],
        ),
      ),
    );
  }
}