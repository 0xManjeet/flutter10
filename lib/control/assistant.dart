import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toughQuiz/models/i_question.dart';
import 'package:toughQuiz/utils/constants.dart';
import 'package:toughQuiz/utils/enums.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Assistant {
  static Future<IQuestionData> fetchQuestion(String qID) async {
    print('========$qID');
    dynamic response =
        await dio.Dio().get(apiEndpoint + qID).then((value) => value.data);

    assert(response['responseType'] == ResponseTypes.Success.index);
    return IQuestionData.fromJson(response['data']['mainData']);
  }

  static void showToast(String msg) => Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
      );
}
