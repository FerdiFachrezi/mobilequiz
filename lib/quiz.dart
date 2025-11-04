import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// Quiz widget groups the Question and Answer widgets.
// It is stateless because the state is managed in main.dart.
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
    // Column arranges its children vertically.
    return Column(
      children: [
        // Display the Question widget.
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        // '...' is the spread operator. It takes a list and "spreads"
        // its elements out as individual widgets in the Column's children list.
        // We are mapping the list of answers to a list of Answer widgets.
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            // We pass an anonymous function to onPressed.
            // This function calls _answerQuestion with the correct score.
            () => answerQuestion(answer['score'] as int),
            answer['text'] as String,
          );
        }).toList() // .map returns an Iterable, so we convert it to a List.
      ],
    );
  }
}
