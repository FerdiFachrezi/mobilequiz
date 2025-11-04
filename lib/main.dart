import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

// 1. MyApp adalah StatefulWidget untuk menyimpan state inti
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // 7. State Management: State disimpan di sini dan aman saat rotasi
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite season?',
      'answers': [
        {'text': 'Winter', 'score': 10},
        {'text': 'Spring', 'score': 5},
        {'text': 'Summer', 'score': 2},
        {'text': 'Autumn', 'score': 7},
      ],
    },
    {
      'questionText': 'What\'s your favorite programming language?',
      'answers': [
        {'text': 'Dart', 'score': 10},
        {'text': 'Python', 'score': 5},
        {'text': 'Java', 'score': 3},
        {'text': 'C#', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 5. Menerapkan Font Kustom secara global
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.indigo, // Anda bisa ganti warnanya
        // Terapkan style text agar konsisten
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontFamily: 'Montserrat'),
          bodyMedium: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          // 4. Menggunakan Aset Ikon
          title: Row(
            children: [
              Icon(Icons.question_answer_rounded),
              SizedBox(width: 10),
              Text('Quiz App'),
            ],
          ),
        ),
        // 2. Navigasi 2 Halaman (Quiz dan Result)
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}

