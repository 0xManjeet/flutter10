//
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toughQuiz/control/quiz_page_control.dart';
import 'package:toughQuiz/pages/quiz_page.dart';
import 'package:toughQuiz/widgets/atoms/atoms.dart';
import 'package:toughQuiz/widgets/molecules/buttons.dart';

// @immutable
// class AppState {
//   final PostsState postsState;

//   AppState({
//     @required this.postsState,
//   });

// }

void main() {
  runApp(StartApp());
}

enum Action { NextAction, PrevAction }

class StartApp extends StatelessWidget {
  QuizPageControl ctrl = Get.put(QuizPageControl());
  @override
  Widget build(BuildContext context) {
    return StoreProvider<dynamic>(
      store: ctrl.store,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tough Quiz',
        home: Scaffold(
          body: Container(
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child:
                          regularText(text: 'Tap to start the quiz', size: 16)),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => primaryButton(
                        text: 'Start Quiz >>',
                        onPressed: () async {
                          await ctrl.fetchFirst();
                          Get.to(
                            QuizPage(),
                            transition: Transition.rightToLeftWithFade,
                          );
                        },
                        isBusy: ctrl.isLoading.value),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
