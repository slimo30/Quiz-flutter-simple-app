import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function x;
  const Answer({super.key, required this.answerText, required this.x});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          x();
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            answerText,
            style: TextStyle(fontSize: 25),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
