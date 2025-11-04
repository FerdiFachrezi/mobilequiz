import 'package:flutter/material.dart';

// Result widget is shown when the quiz is finished.
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback restartHandler;

  const Result(this.resultScore, this.restartHandler, {Key? key})
      : super(key: key);

  // This is a "getter". It's a special property that
  // calculates its value when accessed.
  String get resultPhrase {
    String resultText;
    if (resultScore <= 12) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 18) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 25) {
      resultText = 'You are... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // Center aligns its child in the middle of the screen.
    return Center(
      child: Column(
        // mainAxisAlignment.center also helps center the column's children.
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase, // Use the getter here for the remark.
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            'Final Score: $resultScore',
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: restartHandler,
            child: const Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
