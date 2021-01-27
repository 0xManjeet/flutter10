import 'package:toughQuiz/utils/enums.dart';

class IQuestionData {
  String qID;
  String questionString;
  int answerType;
  Map<String, dynamic> answerData;
  String selectedAnswer;

  IQuestionData.fromJson(Map<String, dynamic> json)
      : qID = json['qID'],
        questionString = json['question'],
        answerType = json['answer']['answerType'],
        answerData = json['answer']['data'];

  set answer(String ans) {
    this.selectedAnswer = ans;
  }
}

/*
import { ActionTypes, AnswerTypes } from '../enums/enums';

type ActionOnNextParams = `actionType` | `actionData`;
type BoxWithIconParams = `option` | `icon_svg`;


export interface ActionOnNext extends Partial<Record<ActionOnNextParams, any>> { }
export interface BoxWithIcon extends Partial<Record<BoxWithIconParams, string>> { }
export interface QuestionInterface {
    qID: string
    question: string,
    answer: {
        answerType: AnswerTypes,
        data: {
            [key: string]: ActionOnNext
        }
    },
}

*/
