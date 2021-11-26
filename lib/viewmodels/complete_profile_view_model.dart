
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';

class CompleteProfileViewModel extends ChangeNotifier {

  List<String> _errors = [];
  List<String> get errors => _errors;

  void _addError({required String error}) {
    if (!_errors.contains(error)) {
      _errors.contains(error);
    }
  }

  void _removeError({required String error}) {
    if (_errors.contains(error)) {
      _errors.remove(error);
    }
  }

  Future<bool> completeProfileWithSpring(String name, String birthday, String gender, String phone) async {
    var dio = Dio();

    Map<String, dynamic> body = {
      "name": name,
      "gender": gender == "male" ? 1 : 0,
      "birthday": birthday,
      "phone": phone
    };

    try {
      await dio.post("$baseUrl/users/detail", options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}), data: body);
      return Future.value(true);
    } on DioError catch (e) {
      _addError(error: kServerError);
    }
    return Future.value(false);
  }
}