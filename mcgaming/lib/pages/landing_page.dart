import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserSelectionPage(),
    );
  }
}

class UserSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1B1E), // Warna background utama
      body: Stack(
        alignment: Alignment.center, // Memusatkan semua elemen
        children: [
          // Container untuk menampung user
          Positioned(
            bottom: 50, // Jarak dari bagian bawah
            child: Container(
              width: 500,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // User 1
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.cyan[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.person, color: Colors.white, size: 60), // Perbesar ukuran ikon
                      ),
                      SizedBox(height: 12),
                      Text("Jack", style: TextStyle(color: Colors.white, fontSize: 18)), // Perbesar ukuran teks
                    ],
                  ),
                  // User 2
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.person, color: Colors.white, size: 60), // Perbesar ukuran ikon
                      ),
                      SizedBox(height: 12),
                      Text("Peng", style: TextStyle(color: Colors.white, fontSize: 18)), // Perbesar ukuran teks
                    ],
                  ),
                  // Tambah User
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 60),
                      ),
                      SizedBox(height: 12),
                      Text("Add User", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Gambar di atas container
          Positioned(
            top: 50, // Jarak dari bagian atas
            child: Image.asset('lib/images/Group 27.png'),
          ),
        ],
      ),
    );
  }
}
