import 'package:flutter/material.dart';
import 'package:toughQuiz/utils/colors.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

Widget stepper({@required int steps, @required currentStep, Color color}) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 30, 0, 25),
    child: StepProgressIndicator(
      totalSteps: steps,
      currentStep: currentStep,
      selectedColor: color ?? stepperColor,
      unselectedColor: Colors.grey[350],
      size: 3.0,
    ),
  );
}
