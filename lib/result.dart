import 'package:flutter/material.dart';

// This is a stateless reusable widget for showing the result.
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  final String userName; // 1. Tambahkan variabel userName

  // 2. Perbarui constructor untuk menerima 3 nilai
  const Result(this.resultScore, this.resetHandler, this.userName, {Key? key})
      : super(key: key);

  // Getter untuk menghitung frasa hasil berdasarkan skor.
  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'Semoga Beruntung lain kali!';
    } else if (resultScore <= 12) {
      resultText = 'Sedikit Lagi!';
    } else if (resultScore <= 16) {
      resultText = 'Lumayan!';
    } else {
      resultText = 'Sangat Hebat!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // Dapatkan ukuran layar perangkat untuk padding yang responsif
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Gunakan SingleChildScrollView untuk mencegah overflow di layar kecil atau saat rotasi
    return SingleChildScrollView(
      child: Container(
        // Tambahkan padding dinamis berdasarkan lebar layar
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1, // 10% dari lebar layar
          vertical: screenHeight * 0.05, // 5% dari tinggi layar
        ),
        width: double.infinity, // Ambil lebar penuh
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Tengah secara vertikal
          crossAxisAlignment: CrossAxisAlignment.center, // Tengah secara horizontal
          children: <Widget>[
            // Ikon dekoratif
            Icon(
              Icons.stars_rounded,
              size: 120,
              color: Colors.amber,
            ),
            SizedBox(height: 20),

            // 3. Tampilkan pesan selamat yang dipersonalisasi
            Text(
              'Congratulations, $userName!', // Gunakan userName
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),

            // Tampilkan skor akhir
            Text(
              'Skor Anda : $resultScore / 50',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                // Gunakan warna primer dari tema
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),

            // Tampilkan frasa hasil
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Tombol untuk mengulang kuis
            ElevatedButton(
              child: Text('Restart Quiz'),
              onPressed: resetHandler,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Warna teks
                backgroundColor: Colors.indigo, // Warna tombol
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat', // Pastikan konsistensi font
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}