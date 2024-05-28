import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> showToastMessage(String message,
    {String errorMessage = ''}) async {
  await Fluttertoast.showToast(
      msg: message.isNotEmpty
          ? (errorMessage.isEmpty ? message : '$message. $errorMessage.')
          : errorMessage,
      backgroundColor: Colors.black,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.white);
}

Future<void> showDioError(DioException e) async {
  if (e.response != null) {
    await showToastMessage(e.response!.data as String);
  }
}
