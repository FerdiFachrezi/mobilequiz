import 'package:flutter/material.dart';

// Answer is another simple, stateless widget.
// It displays a button for a single answer.
class Answer extends StatelessWidget {
  // selectHandler is a function that will be called when the button is pressed.
  final VoidCallback selectHandler;
  // answerText is the text to display on the button.
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Container is used to make the button take up more width.
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   primary: Colors.blue, // background color
        //   onPrimary: Colors.white, // text color
        // ),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
