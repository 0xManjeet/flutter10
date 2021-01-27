import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:toughQuiz/control/quiz_page_control.dart';

Widget quizAppBar(int currentQuestionNumber) => currentQuestionNumber == 0
    ? Container()
    : Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              icon: Icon(
                CupertinoIcons.back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Get.find<QuizPageControl>().currentQuestion.value = 0;
                Get.back();
              }),
        ],
      );
