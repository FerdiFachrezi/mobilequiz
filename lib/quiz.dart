import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// 3. Widget Terpisah/Reusable (Stateless)
// Widget ini stateless karena hanya menampilkan data yang diterima dari 'main.dart'.
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(int) answerQuestion;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 6. UI Dinamis: Gunakan SingleChildScrollView
    //    Ini mencegah error 'RenderFlex overflow' saat rotasi layar
    //    atau di layar yang lebih kecil, dengan membuat konten bisa di-scroll.
    return SingleChildScrollView(
      child: Padding(
        // Beri jarak dari tepi layar
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: [
            Question(
              questions[questionIndex]['questionText'] as String,
            ),
            // Beri jarak antara soal dan jawaban pertama
            SizedBox(height: 20),
            // '...' (spread operator) mengambil list jawaban
            // dan menambahkannya sebagai widget individu ke dalam Column
            ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
                .map((answer) {
              return Answer(
                () => answerQuestion(answer['score'] as int),
                answer['text'] as String,
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}

