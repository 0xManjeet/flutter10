import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toughQuiz/control/quiz_page_control.dart';
import 'package:toughQuiz/models/i_question.dart';
import 'package:toughQuiz/utils/colors.dart';
import 'package:toughQuiz/utils/enums.dart';
import 'package:toughQuiz/widgets/organisms/gender_selector.dart';
import '../molecules/input_field.dart';
import 'package:toughQuiz/widgets/atoms/atoms.dart';

Widget questionBlock(IQuestionData qData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: boldText(text: qData.questionString, size: 18),
      ),
      // pass a callback to aswers, like ctrl.processAnswer(optionLey);
      if (qData.answerType == AnswerTypes.Text.index)
        textAnswerBlock(qData.questionString)
      else if (qData.answerType == AnswerTypes.Date.index)
        textAnswerBlock(qData.questionString)
      else if (qData.answerType == AnswerTypes.GenderSelection.index)
        genderAnswerBlock()
      else if (qData.answerType == AnswerTypes.MCQ.index)
        mcqAnswerBlock(qData.answerData)
    ],
  );
}

Widget genderAnswerBlock() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(5, 20, 5, 25),
    child: genderSelector((val) {
      Get.find<QuizPageControl>().selectedAnswer.value = val;
      Get.forceAppUpdate();
    }, Get.find<QuizPageControl>().selectedAnswer.value),
  );
}

Widget mcqAnswerBlock(Map answersList) {
  List<Widget> options = [];
  print(answersList.keys);
  answersList.keys.forEach((element) {
    options.add(RadioListTile(
      value: element,
      groupValue: Get.find<QuizPageControl>().selectedAnswer.value,
      activeColor: primaryColor,
      onChanged: (val) {
        Get.find<QuizPageControl>().selectedAnswer.value = val;
        Get.forceAppUpdate();
      },
      title: Text(element),
    ));
  });
  return Padding(
    padding: EdgeInsets.fromLTRB(5, 10, 5, 30),
    child: Column(children: options),
  );
}

Widget textAnswerBlock(String questionString) {
  return Padding(
    padding: EdgeInsets.fromLTRB(5, 10, 5, 30),
    child: inputField((val) {
      Get.find<QuizPageControl>().selectedAnswer.value = val;
    }, questionString),
  );
}
