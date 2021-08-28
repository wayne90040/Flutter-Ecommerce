
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/constants.dart';

class SignUpViewModel extends ChangeNotifier {

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

  Future<bool> registrationWithEmail({
    required String email,
    required String password,
    required String confirmPassword }) async {
    
    if (!_validEmail(email: email)) {
      return Future.value(false);
    }

    if (!_validPassword(password: password, confirmPassword: confirmPassword)) {
      return Future.value(false);
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return Future.value(true);
    } on FirebaseException catch (e) {
      // catch error
    } catch (e) {
      // catch error
    }
    return Future.value(false);
  }

  bool _validEmail({required String email}) {
    if (email.isEmpty) {
      _addError(error: kEmailNullError);
      return false;
    } else {
      _removeError(error: kEmailNullError);
      if (!emailValidatorRegExp.hasMatch(email)) {
        _addError(error: kInvalidEmailError);
        return false;
      } else {
        _removeError(error: kInvalidEmailError);
      }
    }
    return true;
  }

  bool _validPassword({required String password, required String confirmPassword}) {
    if (password.isEmpty) {
      _addError(error: kPassNullError);
      return false;
    } else {
      _removeError(error: kPassNullError);
      if (password.length < 8) {
        _addError(error: kShortPassError);
        return false;
      } else {
        _removeError(error: kShortPassError);
        if (password != confirmPassword) {
          _addError(error: kMatchPassError);
          return false;
        }
        else {
          _removeError(error: kMatchPassError);
        }
      }
    }
    return true;
  }
}