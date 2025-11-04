import 'package:flutter/material.dart';

// 3. Widget Terpisah/Reusable (Stateless)
class Question extends StatelessWidget {
  final String questionText;

  // Constructor dengan key
  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 6. UI Dinamis: 'double.infinity' membuat container
      //    mengisi lebar layar secara horizontal.
      width: double.infinity,
      // Beri jarak vertikal
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        questionText,
        // 5. Font Kustom: Style di bawah ini akan digabungkan
        //    dengan theme 'Montserrat' global dari main.dart
        style: TextStyle(
          fontSize: 24, // Ukuran font lebih besar untuk soal
          fontWeight: FontWeight.bold, // Dibuat tebal agar menonjol
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

