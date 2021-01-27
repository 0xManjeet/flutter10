import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:toughQuiz/widgets/atoms/atoms.dart';
import 'package:get/get.dart';
import 'package:toughQuiz/control/quiz_page_control.dart';
import 'package:toughQuiz/widgets/molecules/buttons.dart';
import '../main.dart';

class EndQuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: regularText(text: 'The quiz has ended.', size: 26),
          )

          //  SizedBox(height: 15,),
          //primaryButton(text: '< Go back', onPressed: ()=>Get.offAll())
        ],
      )),
    );
  }
}
