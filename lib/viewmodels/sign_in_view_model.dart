

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/constants.dart';

class SignInViewModel extends ChangeNotifier {
  List<String> _errors = [];
  List<String> get errors => _errors;

  void _addError({required String error}) {
    if (!_errors.contains(error)) {
      _errors.add(error);
      notifyListeners();
    }
  }

  void _removeError({required String error}) {
    if (_errors.contains(error)) {
      _errors.remove(error);
      notifyListeners();
    }
  }

  Future<bool> signInWithFirebaseEmail({required String email, required String password}) async {

    if (email.isEmpty) {
      _addError(error: kEmailNullError);
      return Future.value(false);
    } else {
      _removeError(error: kEmailNullError);

    }

    if (password.isEmpty) {
      _addError(error: kPassNullError);
      return Future.value(false);
    } else {
      _removeError(error: kPassNullError);
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return Future.value(true);
    } on FirebaseException catch (e) {
      // return Future.value(false);
    } catch (e) {
      // return Future.value(false);
    }

    return Future.value(false);
  }
}