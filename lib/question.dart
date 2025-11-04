import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  // This is a constructor. It requires a questionText.
  // const means it's a compile-time constant constructor.
  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Container adds padding and margin.
    return Container(
      // double.infinity makes the container take all available width.
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        // Styles the text.
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
