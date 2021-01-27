import 'package:get/state_manager.dart';
import 'package:toughQuiz/models/i_question.dart';

class AddNewQuestion {
  int qNumber;
  IQuestionData questionData;
  AddNewQuestion(this.qNumber, this.questionData);
}

class SelectOption {
  int qNumber;
  String answer;
  SelectOption(this.qNumber, this.answer);
}

class ProcessActionOnNext {
  Map actionOnNext;
  ProcessActionOnNext(this.actionOnNext);
}
