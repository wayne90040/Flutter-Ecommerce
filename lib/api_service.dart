

import 'dart:io';

import 'package:dio/dio.dart';

import 'constants.dart';

class NormalResult {
  bool success;
  String? errorDesc;

  NormalResult(this.success, this.errorDesc);
}


class ApiService {

  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal();

  Future<NormalResult> registerWithEmail(String userName, String email, String password) async {

    Map<String, dynamic> body = {
      "username": userName,
      "email": email,
      "password": password
    };

    String desc = "";

    try {
      await Dio().post("$baseUrl/registration",
          options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: body);

      return Future.value(NormalResult(true, null));

    } on DioError catch (e) {
      dynamic data = e.response?.data;
      String errorCode = data is Map ? data["error"] : "";

      switch (errorCode) {
        case "EMAIL_IS_EXIST":
          desc = kEmailAlreadyInUse;
          break;
        case "USERNAME_IS_EXIST":
          desc = kUsernameAlreadyInUse;
          break;
        case "EMAIL_NOT_VALID":
          desc = kInvalidEmailError;
          break;
        default:
          desc = kServerError;
          break;
      }
    }
    return Future.value(NormalResult(false, desc));
  }

  Future<NormalResult> loginWithEmail(String email, String password) async {

    Map<String, String> body = {
      "email": email,
      "password": password
    };

    String desc = "";

    try {
      final response = await Dio().post("$baseUrl/login",
          options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: body);
      print(response);
      return Future.value(NormalResult(true, null));
    } on DioError catch (e) {

    }

    return Future.value(NormalResult(false, desc));
  }

}