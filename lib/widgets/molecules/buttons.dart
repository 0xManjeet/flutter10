import 'package:flutter/material.dart';
import 'package:toughQuiz/utils/colors.dart';
import 'package:toughQuiz/widgets/atoms/atoms.dart';

Widget primaryButton(
    {@required String text,
    @required VoidCallback onPressed,
    bool isBusy = false}) {
  return isBusy
      ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: primaryColor),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ],
        )
      : MaterialButton(
          onPressed: onPressed,
          color: primaryColor,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: regularText(text: text, color: Colors.white),
        );
}
