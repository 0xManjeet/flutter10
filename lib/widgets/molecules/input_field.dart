import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toughQuiz/utils/colors.dart';
import 'package:toughQuiz/widgets/atoms/atoms.dart';

Widget inputField(Function onChanged, String label) {
  return TextField(
    onChanged: onChanged,
    cursorColor: primaryColor,
    decoration: InputDecoration(
      labelText: label,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor.withAlpha(100),
          width: 2.0,
        ),
      ),
      labelStyle: TextStyle(color: Colors.grey),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor.withAlpha(100),
          width: 2.0,
        ),
      ),
    ),
  );
}
