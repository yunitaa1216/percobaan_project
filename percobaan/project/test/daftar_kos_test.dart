import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/main.dart'; // Sesuaikan dengan impor utama aplikasi Anda
import 'package:project/widget/daftar_kos.dart'; // Sesuaikan dengan lokasi kode DaftarKos

void main() {
  testWidgets('DaftarKos widget test', (WidgetTester tester) async {
    // Build our widget
    await tester.pumpWidget(
      MaterialApp(
        home: DaftarKos(
          imagePath: 'assets/kos_1.jpg',
          nameKos: 'Kos Bahagia',
          harga: '500k/bulan',
          fasilitas: 'Kamar mandi dalam, AC, Wifi, CCTV, Parkir',
          onPressed: () {},
        ),
      ),
    );

    // Use finder to locate elements in the widget
    final nameKosFinder = find.text('Kos Bahagia');
    final hargaFinder = find.text('500k/bulan');
    final fasilitasFinder = find.text('Kamar mandi dalam, AC, Wifi, CCTV, Parkir');
    final detailButtonFinder = find.text('Detail');

    // Verify that the elements are displayed in the widget
    expect(nameKosFinder, findsOneWidget);
    expect(hargaFinder, findsOneWidget);
    expect(fasilitasFinder, findsOneWidget);
    expect(detailButtonFinder, findsOneWidget);
  });
}