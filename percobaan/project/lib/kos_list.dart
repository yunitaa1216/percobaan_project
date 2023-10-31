// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class CoffeeShopDetail extends StatelessWidget {
//   final String imagePath;
//   final String nameShop;
//   final String harga;
//   final String fasilitas;
//   final String phoneNumber;

//   CoffeeShopDetail({
//     required this.imagePath,
//     required this.nameShop,
//     required this.harga,
//     required this.fasilitas,
//     required this.phoneNumber,
//   });

//   void _showReservationBottomSheet(BuildContext context) {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController shopNameController = TextEditingController();

//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text("Make a Reservation"),
//             TextFormField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: "Your Name"),
//             ),
//             TextFormField(
//               controller: phoneController,
//               decoration: InputDecoration(labelText: "Your Phone Number"),
//             ),
//             TextFormField(
//               controller: shopNameController,
//               decoration: InputDecoration(labelText: "Shop Name to Reserve"),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle reservation submission here
//                 String userName = nameController.text;
//                 String userPhone = phoneController.text;
//                 String shopToReserve = shopNameController.text;

//                 // You can use the entered data for the reservation process
//                 // For example, print the values for now:
//                 print("User Name: $userName");
//                 print("User Phone: $userPhone");
//                 print("Shop to Reserve: $shopToReserve");
                
//               },
//               child: Text("Submit Reservation"),
              
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(nameShop),
//       ),
//      body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(imagePath),
//             Text(nameShop),
//             Text("Harga: $harga"),
//             Text("Fasilitas: $fasilitas"),
//             SizedBox(height: 16.0),
//             TextButton(
//               onPressed: () {
//                 // Telepon pemilik kos
//                 launch('whatsapp://send?phone=${082136619175}');
//               },
//               child: Text("Telepon Pemilik Kos"),
//             ),
//             SizedBox(height: 16.0),
//             TextButton(
//   onPressed: () {
//     // Show the reservation bottom sheet
//     _showReservationBottomSheet(context);
//   },
//   child: Text("Make a Reservation"),
// ),

//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class CoffeeShopDetail extends StatelessWidget {
  final String imagePath;
  final String nameShop;
  final String harga;
  final String fasilitas;
  final String phoneNumber;
  bool _isFormVisible = false;

  CoffeeShopDetail({
    required this.imagePath,
    required this.nameShop,
    required this.harga,
    required this.fasilitas,
    required this.phoneNumber,
  });

  TextEditingController _textController = TextEditingController(); // Ini adalah controller untuk TextField.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _response = "";
  
  Future<void> _submitForm() async {
    String key = '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';
    if (_formKey.currentState!.validate()){
      final apikey = key;
      const apiUrl = 'https://api.openai.com/v1/completions';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8',
          'Authorization': 'Bearer $apikey'
        },
        body: jsonEncode(<String, dynamic>{
          "model":"text-davinci-003",
          'prompt': "Jika ada yang bertanya siapa kamu, silahkan jawab saya adalah ai buatan yunita" +
                    _textController.text,
                    'max_tokens':50,
        })
      );
      if(response.statusCode == 200){
        final responseData = jsonDecode(response.body);
        print('Respon sukses: ${responseData['choices'][0]['text']}');
      } else {
        print('Gagal mendapatkan respon. Kode status: ${response.statusCode}');
      }
    }else{
      print('validasi terlebih dahulu');
    }
  }
  
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
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                children: [
                  TextField(
                    controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Contoh Textfield',
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
              onPressed:_submitForm, 
              child: Text('Submit')),
              SizedBox(height: 16.0),
              Text('Response : $_response')
          ],
              )
            ),
        ),
          ],
        ),        
      ),
    );
  }
}