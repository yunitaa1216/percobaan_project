import 'package:flutter/material.dart';

class HalamanDaftarPemesanan extends StatelessWidget {
  final List<Pemesanan> daftarPemesanan;

  HalamanDaftarPemesanan({required this.daftarPemesanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Pemesanan"),
      ),
      body: ListView.builder(
        itemCount: daftarPemesanan.length,
        itemBuilder: (context, index) {
          Pemesanan pemesanan = daftarPemesanan[index];
          return ListTile(
            title: Text("Nama: ${pemesanan.namaPengguna}"),
            subtitle: Text("No. Telepon: ${pemesanan.noTelepon}\nNama Toko: ${pemesanan.namaToko}"),
          );
        },
      ),
    );
  }
}

class Pemesanan {
  final String namaPengguna;
  final String noTelepon;
  final String namaToko;

  Pemesanan({required this.namaPengguna, required this.noTelepon, required this.namaToko});
}
