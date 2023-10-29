import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class CoffeeShopDetail extends StatelessWidget {
  final String imagePath;
  final String nameShop;
  final String harga;
  final String fasilitas;
  final String phoneNumber;
  final String kosId;

  CoffeeShopDetail({
    required this.imagePath,
    required this.nameShop,
    required this.harga,
    required this.fasilitas,
    required this.phoneNumber,
    required this.kosId,
  });

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
                launch('whatsapp://send?phone=${phoneNumber}');
              },
              child: Text("Telepon Pemilik Kos"),
            ),
            TextButton(
              onPressed: () async {
                // Buat pesanan
                final response = await http.post(
                  Uri.parse('https://api.example.com/kos/${kosId}/orders'),
                  headers: {
                    'Authorization': 'Bearer YOUR_API_TOKEN',
                  },
                  body: {
                    'name': 'John Doe',
                    'phone_number': '+628123456789',
                    'order_items': [
                      {
                        'item_id': 1,
                        'quantity': 1,
                        'notes': 'Tambahkan balkon',
                      },
                      {
                        'item_id': 2,
                        'quantity': 2,
                        'notes': 'Tanpa AC',
                      },
                    ],
                  },
                );

                if (response.statusCode == 201) {
                  // Pesanan berhasil dibuat
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pesanan berhasil dibuat!'),
                    ),
                  );
                } else {
                  // Pesanan gagal dibuat
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pesanan gagal dibuat!'),
                    ),
                  );
                }
              },
              child: Text("Buat Pesanan Kos"),
            ),
          ],
        ),
      ),
    );
  }
}