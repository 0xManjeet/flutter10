import 'dart:math';
import 'package:toughQuiz/redux/actions.dart';
import '../models/i_question.dart';

Map<int, IQuestionData> qReducers(
    Map<int, IQuestionData> state, dynamic action) {
  if (action is AddNewQuestion) {
    return <int, IQuestionData>{}
      ..addAll(state)
      ..update(action.qNumber, (value) => action.questionData,
          ifAbsent: () => action.questionData);
  }

  if (action is SelectOption) {
    IQuestionData qData = state[action.qNumber];
    qData.answer = action.answer;
    return state..update(action.qNumber, (value) => qData);
  }

  return state;
}
