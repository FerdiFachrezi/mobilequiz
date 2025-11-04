import 'package:flutter/material.dart';

// 3. Widget Terpisah/Reusable (Stateless)
class Answer extends StatelessWidget {
  // Function yang akan dieksekusi saat tombol ditekan
  final VoidCallback selectHandler;
  final String answerText;

  // Constructor dengan key
  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 6. UI Dinamis: 'double.infinity' membuat container
      //    mengisi lebar layar secara horizontal.
      width: double.infinity,
      // Beri jarak antar tombol jawaban
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: ElevatedButton(
        // 4 & 5. Styling tombol agar lebih modern dan konsisten
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Warna teks tombol
          backgroundColor: Theme.of(context).primaryColor, // Warna latar tombol
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Sudut membulat
          ),
          padding: EdgeInsets.symmetric(vertical: 15), // Padding vertikal
        ),
        onPressed: selectHandler,
        child: Text(
          answerText,
          // Font 'Montserrat' akan diterapkan dari Theme global
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

