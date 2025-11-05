import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

class QuizScreen extends StatefulWidget {
  final String userName; // Menerima nama pengguna

  const QuizScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // _questions berisi semua data kuis.
  final _questions = const [
    {
      'questionText': 'Apa jenis file yang dipakai flutter?',
      'answers': [
        {'text': '.dart', 'score': 10},
        {'text': '.py', 'score': 0},
        {'text': '.cpp', 'score': 0},
        {'text': '.exe', 'score': 0},
      ],
    },
    {
      'questionText': 'Manakah ibu kota Indonesia',
      'answers': [
        {'text': 'Medan', 'score': 0},
        {'text': 'Jakarta', 'score': 10},
        {'text': 'Surabaya', 'score': 0},
        {'text': 'Bandung', 'score': 0},
      ],
    },
    {
      'questionText': 'Di Fakultas manakah gedung ini berada?',
      'answers': [
        {'text': 'Fasilkom-TI', 'score': 10},
        {'text': 'FK', 'score': 0},
        {'text': 'FEB', 'score': 0},
        {'text': 'FKG', 'score': 0},
      ],
    },
    {
      'questionText': 'Manakah yang berbeda',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 0},
        {'text': 'No', 'score': 0},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Manakah yang digunakan untuk mendesain',
      'answers': [
        {'text': 'Visual Studio Code', 'score': 0},
        {'text': 'Flutter', 'score': 0},
        {'text': 'Figma', 'score': 10},
        {'text': 'Dev C++', 'score': 0},
      ],
    },
  ];

  // _questionIndex melacak pertanyaan mana yang sedang ditampilkan.
  var _questionIndex = 0;
  // _totalScore mengakumulasi skor pengguna.
  var _totalScore = 0;

  // _restartQuiz mereset state ke awal.
  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // _answerQuestion dipanggil saat tombol jawaban ditekan.
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Gunakan Scaffold untuk halaman kuis
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.userName}\'s Quiz'),
        // Sesuai permintaan Anda, logo '?'
        leading: Icon(Icons.question_mark), 
      ),
      // Logika untuk menampilkan Kuis atau Hasil
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          // Teruskan userName ke widget Result
          : Result(_totalScore, _restartQuiz, widget.userName),
    );
  }
}