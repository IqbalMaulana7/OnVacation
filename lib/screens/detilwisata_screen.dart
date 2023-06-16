import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onvocation/screens/profile_screen.dart';
import 'package:onvocation/screens/home_screen.dart';

class DetailScreen extends StatelessWidget {
  final Menu menu;
  const DetailScreen(this.menu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              menu.imageUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/onvocation-81249.appspot.com/o/btn_back.png?alt=media&token=0387507b-cb93-4e14-bf96-0894af3f0389&_gl=1*1swxcur*_ga*NTYyMDIyOTE4LjE2ODQxNzY3MzU.*_ga_CW55HF8NVT*MTY4NjMxNzkxNi4zMS4xLjE2ODYzMTc5NDMuMC4wLjA.',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 264),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    menu.name,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  const SizedBox(width: 16),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(
                                    menu.kategori,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      // decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star_half,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const SizedBox(width: 16),
                                  InkWell(
                                    onTap: () {
                                      ;
                                    },
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        'Review Foto Lainnya',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Tambahkan jarak di setiap sisi gambar
                                    child: Image.network(
                                      menu.imageUrl,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Tambahkan jarak di setiap sisi gambar
                                    child: Image.network(
                                      menu.imageUrl,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                // jlwatuulono37watuulosumberrejo (44:733)
                                right: 24,
                                top: 176,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 72,
                                    height: 36,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            30.0, // Menambahkan jarak 10cm di sisi kanan
                                      ),
                                      child: Text(
                                        'Jl. Watu Ulo No.37, Watu Ulo, Sumberrejo, Kec. Ambulu, Kabupaten Jember, Jawa Timur 68431',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          letterSpacing: -0.1650000066,
                                          color: const Color(0xff0a0a0a),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // jlwatuulono37watuulosumberrejo (44:733)
                                right: 24,
                                top: 176,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 72,
                                    height: 36,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            30.0, // Menambahkan jarak 10cm di sisi kanan
                                      ),
                                      child: Text(
                                        'Harga Mulai Rp.25.000',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          letterSpacing: -0.1650000066,
                                          color: const Color(0xff0a0a0a),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // jlwatuulono37watuulosumberrejo (44:733)
                                right: 24,
                                top: 176,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 72,
                                    height: 36,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            30.0, // Menambahkan jarak 10cm di sisi kanan
                                      ),
                                      child: Text(
                                        'Jam terbaik pukul 07.00-17.00',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          letterSpacing: -0.1650000066,
                                          color: const Color(0xff0a0a0a),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 18),
                              Text(
                                'Deskripsi obyek wisata',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // ignore: sized_box_for_whitespace
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Pantai Watu Ulo adalah sebuah Pantai yang terletak di pantai selatan Jawa Timur, tepatnya di desa Sumberejo, kecamatan Ambulu, Jember. Mayoritas penduduk di Pantau Watu Ulo berasal dari etnis Madura dan kebanyakan berprofesi sebagai nelayan dan petani.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                'Jam buka',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // ignore: sized_box_for_whitespace
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  '07.00-18.00 WIB',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
