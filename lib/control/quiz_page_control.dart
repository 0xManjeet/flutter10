import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:get/get.dart';
import 'package:toughQuiz/control/assistant.dart';
import 'package:toughQuiz/models/i_question.dart';
import 'package:toughQuiz/pages/end_quiz_page.dart';
import 'package:toughQuiz/redux/actions.dart';
import 'package:toughQuiz/redux/reducers.dart';
import 'package:toughQuiz/utils/constants.dart';
import 'package:toughQuiz/utils/enums.dart';

class QuizPageControl extends GetxController {
  RxInt currentQuestion = 0.obs;
  Store store = Store<Map<int, IQuestionData>>(qReducers, initialState: {});
  int totalQuestions = 7;
  var isLoading = false.obs;

  RxString selectedAnswer = ''.obs;
  String optionKey;

  void processActionOnNext() {
    print(selectedAnswer);
    if (selectedAnswer?.value == null)
      Assistant.showToast('Please select/enter an answer');
    else {
      store.dispatch(SelectOption(currentQuestion.value, selectedAnswer.value));
      Map answerData = store.state[currentQuestion.value].answerData;
      printInfo(info: answerData.toString());
      if (store.state[currentQuestion.value].answerType ==
              AnswerTypes.MCQ.index ||
          store.state[currentQuestion.value].answerType ==
              AnswerTypes.GenderSelection.index) {
        optionKey = selectedAnswer.value;
      } else {
        optionKey = "default";
      }
      Map actionOnNext = answerData[optionKey];

      ///Running outta time to code other actionOnNext features
      if (actionOnNext['actionType'] == ActionTypes.NewQuestion.index) {
        loadNext(currentQuestion.value + 1, actionOnNext['actionData']);
      } else {
        selectedAnswer.value = null;
        Get.offAll(EndQuizPage(), transition: Transition.rightToLeftWithFade);
      }
    }
  }

  Future<void> fetchFirst() async {
    isLoading.value = true;
    IQuestionData value = await Assistant.fetchQuestion('firstQuestion');
    store.dispatch(AddNewQuestion(0, value));
    isLoading.value = false;
  }

  void loadNext(int qNumber, String qID) {
    isLoading.value = true;
    Assistant.fetchQuestion(qID).then((value) {
      currentQuestion.value++;
      selectedAnswer.value = null;
      store.dispatch(AddNewQuestion(qNumber, value));
      isLoading.value = false;
    });
  }
}
