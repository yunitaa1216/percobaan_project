import 'package:project/widget/kos_list.dart';
import 'package:project/widget/daftar_kos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:project/view_model/userprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    // Mengakses email dan password dari user (jika user ada)
    final userEmail = user?.email;
    final userPassword = user?.password;
    
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chatbot"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/chat');
          }
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        height: 140, width: double.infinity, color: Colors.brown),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('assets/KosApp.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.circular(35),
                                            border: Border.all(
                                                color: Colors.white,
                                                style: BorderStyle.solid,
                                                width: 2))),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Selamat Datang !",
                                                  style:
                                                      GoogleFonts.montserrat(color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  "Daftar Kos 🏡",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                              DaftarKos(
                                imagePath: "assets/kos_1.jpg",
                                nameKos: "Kos Bahagia",
                                harga: "500k/bulan",
                                fasilitas: "Kamar mandi dalam, AC, Wifi, CCTV, Parkir",
                                onPressed: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => DaftarKosDetail(
                                      imagePath: "assets/kos_1.jpg", 
                                      nameShop: "Kos Bahagia", 
                                      harga: "500k/bulan", 
                                      fasilitas: "Kamar mandi dalam, AC, Wifi, CCTV, Parkir",
                                      phoneNumber: "082136619175",))
                                  );
                                },
                              ),
                              DaftarKos(
                                imagePath: "assets/kos_2.jpg",
                                nameKos: "Kos Sejahtera",
                                harga: "4.9",
                                fasilitas: "13.00 - 23.00",
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DaftarKosDetail(
                                        imagePath: "assets/kos_2.jpg",
                                        nameShop: "Kos Sejahtera",
                                        harga: "4.9",
                                        fasilitas: "13.00 - 23.00",
                                        phoneNumber: "082136619175",
                                      ),
                                    ),
                                  );
                                },
                              ),
                              DaftarKos(
                                imagePath: "assets/kos_3.jpg",
                                nameKos: "Kos Ibu Dewi",
                                harga: "4.7",
                                fasilitas: "13.00 - 20.00",
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DaftarKosDetail(
                                        imagePath: "assets/kos_3.jpg",
                                        nameShop: "Kos Ibu Dewi",
                                        harga: "4.7",
                                        fasilitas: "13.00 - 20.00",
                                        phoneNumber: "082136619175",
                                      ),
                                    ),
                                  );
                                },
                              ),
                              DaftarKos(
                                imagePath: "assets/kos_4.jpg",
                                nameKos: "Kos Makmur",
                                harga: "4.7",
                                fasilitas: "13.00 - 20.00",
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DaftarKosDetail(
                                        imagePath: "assets/kos_4.jpg",
                                        nameShop: "Kos Makmur",
                                        harga: "4.7",
                                        fasilitas: "13.00 - 20.00",
                                        phoneNumber: "082136619175",
                                      ),
                                    ),
                                  );
                                },
                              ),
                            
              ],
            )
        ),
      ),
    );
  }
}