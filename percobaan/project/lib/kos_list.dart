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

  void _showReservationBottomSheet(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Make a Reservation"),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Your Name"),
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Your Phone Number"),
            ),
            TextFormField(
              controller: shopNameController,
              decoration: InputDecoration(labelText: "Shop Name to Reserve"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle reservation submission here
                String userName = nameController.text;
                String userPhone = phoneController.text;
                String shopToReserve = shopNameController.text;

                // You can use the entered data for the reservation process
                // For example, print the values for now:
                print("User Name: $userName");
                print("User Phone: $userPhone");
                print("Shop to Reserve: $shopToReserve");
                
              },
              child: Text("Submit Reservation"),
              
            ),
          ],
        ),
      );
    },
  );
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
                launch('whatsapp://send?phone=${082136619175}');
              },
              child: Text("Telepon Pemilik Kos"),
            ),
            SizedBox(height: 16.0),
            TextButton(
  onPressed: () {
    // Show the reservation bottom sheet
    _showReservationBottomSheet(context);
  },
  child: Text("Make a Reservation"),
),

          ],
        ),
      ),
    );
  }
}
