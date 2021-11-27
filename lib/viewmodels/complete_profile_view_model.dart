

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/api_service.dart';

class CompleteProfileViewModel extends ChangeNotifier {

  List<String> _errors = [];
  List<String> get errors => _errors;

  // void _addError({required String error}) {
  //   if (!_errors.contains(error)) {
  //     _errors.contains(error);
  //   }
  // }
  //
  // void _removeError({required String error}) {
  //   if (_errors.contains(error)) {
  //     _errors.remove(error);
  //   }
  // }

  Future<bool> completeProfileWithSpring(String name, String birthday, String gender, String phone) async {

    // TODO: Valid Data
    NormalResult result = await ApiService().postUserDetail(name, birthday, gender, phone);
    return Future.value(result.success);
  }
}