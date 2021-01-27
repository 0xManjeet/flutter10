import 'package:flutter/material.dart';
import 'package:toughQuiz/widgets/atoms/atoms.dart';

Widget previousQuestion(String question, String answer) {
  print(question + answer);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      boldText(text: question, size: 13, color: Colors.grey),
      SizedBox(
        height: 5,
      ),
      regularText(text: answer, size: 13, color: Colors.grey)
    ],
  );
}
