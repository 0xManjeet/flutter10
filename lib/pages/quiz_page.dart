import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:toughQuiz/control/quiz_page_control.dart';
import 'package:toughQuiz/widgets/molecules/buttons.dart';
import 'package:toughQuiz/widgets/molecules/texts.dart';
import 'package:toughQuiz/widgets/organisms/appBar.dart';
import 'package:toughQuiz/widgets/organisms/gender_selector.dart';
import 'package:toughQuiz/widgets/molecules/input_field.dart';
import 'package:toughQuiz/widgets/organisms/previous_question.dart';
import 'package:toughQuiz/widgets/organisms/question_block.dart';
import 'package:toughQuiz/widgets/organisms/stepper.dart';

class QuizPage extends StatelessWidget {
  QuizPageControl ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar://quizAppBar(ctrl.currentQuestion.value),
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => quizAppBar(ctrl.currentQuestion.value)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerText('About You'),
                    Obx(() => stepper(
                        steps: ctrl.totalQuestions,
                        currentStep: ctrl.currentQuestion.value + 1)),

                    ///If qNo. > 0 , show PrevQuestion
                    Obx(
                      () => ctrl.currentQuestion.value == 0
                          ? Container()
                          : StoreConnector(
                              builder: (ctx, state) {
                                String qString =
                                    state[ctrl.currentQuestion.value - 1]
                                        .questionString;
                                String answer =
                                    state[ctrl.currentQuestion.value - 1]
                                        .selectedAnswer;

                                return previousQuestion(qString, answer);
                              },
                              converter: (store) => store.state),
                    ),
                    StoreConnector(
                        builder: (ctx, questionsList) {
                          return questionBlock(
                              questionsList[ctrl.currentQuestion.value]);
                        },
                        converter: (store) => store.state),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Obx(
                          () => primaryButton(
                            text: 'Next',
                            onPressed: () => ctrl.processActionOnNext(),
                            isBusy: ctrl.isLoading.value,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
