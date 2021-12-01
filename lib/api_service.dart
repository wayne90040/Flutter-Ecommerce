

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/models/discount.dart';
import 'package:flutter_ecommerce/share_preference_manager.dart';

import 'constants.dart';

// Server API
const String baseUrl = "http://8e97-58-115-69-75.ngrok.io/api/v1";


class NormalResult {
  bool success;
  dynamic response;
  String? errorDesc;

  NormalResult(this.success, this.response, this.errorDesc);
}


class ApiService {

  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal();

  /* Register */
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

      return Future.value(NormalResult(true, null, null));

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
    return Future.value(NormalResult(false, null, desc));
  }

  /* Login */
  Future<NormalResult> loginWithEmail(String email, String password) async {

    Map<String, String> body = {
      "email": email,
      "password": password
    };

    String desc = "";

    try {
      final response = await Dio().post("$baseUrl/user/login",
          options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: body);

      var data = response.data as Map<String, dynamic>;
      String accessToken = data["access_token"];

      SharePreferenceManager.set(SharePreferenceKey.accessToken, accessToken);

      return Future.value(NormalResult(true, null, null));

    } on DioError catch (e) {
      var data = e.response?.data;
      desc = data is Map ? data["error"] : "";
    }
    return Future.value(NormalResult(false, null, desc));
  }

  /* Post User Detail */
  Future<NormalResult> postUserDetail(String name, String birthday, String gender, String phone) async {

    Map<String, dynamic> body = {
      "name": name,
      "gender": gender == "male" ? 1 : 0,
      "birthday": birthday,
      "phone": phone
    };

    String desc = "";
    String accessToken = await SharePreferenceManager.get(SharePreferenceKey.accessToken);

    try {
      await Dio().post("$baseUrl/users/detail",
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: accessToken
          }),
          data: body
      );
      return Future.value(NormalResult(true, null, null));

    } on DioError catch (e) {
      var data = e.response?.data;
      desc = data is Map ? data["error"] : "";
    }
    return Future.value(NormalResult(false, null, desc));
  }

  /* Get Discounts */
  Future<NormalResult> getDiscounts(String zoneId) async {

    String accessToken = await SharePreferenceManager.get(SharePreferenceKey.accessToken);

    try {
      var response = await Dio().get("$baseUrl/discount",
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: accessToken,
        }),
        queryParameters: {
          "zone": "supermarket"
        }
      );

      var json = response.data as Map<String, dynamic>;

      return Future.value(NormalResult(true, Discount.fromJson(json), null));
    } on DioError catch (e) {

    }
    return Future.value(NormalResult(false, null, null));
  }
}
