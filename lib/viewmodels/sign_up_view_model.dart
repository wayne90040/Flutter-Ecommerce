
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/constants.dart';


enum LoadingStatus {
  loading, none, error, success
}

class SignUpViewModel extends ChangeNotifier {

  late LoadingStatus _status;
  LoadingStatus get status => _status;

  late List<String> _errors;
  List<String> get errors => _errors;


  Future<void> registrationWithEmail({
    required String email,
    required String password,
    required String confirmPassword }) async {
    
    if (!_validEmail(email: email)) {
      return;
    }

    if (!_validPassword(password: password, confirmPassword: confirmPassword)) {
      return;
    }
    
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      _status = LoadingStatus.success;
    } on FirebaseException catch (e) {
      _status = LoadingStatus.error;
    } catch (e) {
      _status = LoadingStatus.error;
    }
  }

  bool _validEmail({required String email}) {
    if (email.isEmpty) {
      _addError(error: kEmailNullError);
      return false;
    } else {
      _removeError(error: kEmailNullError);
      if (emailValidatorRegExp.hasMatch(email)) {
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
      _removeError(error: kPassNullError)
      if (password.length < 8) {
        _addError(error: kShortPassError);
        return false;
      } else {
        _removeError(error: kShortPassError);
        if (password != confirmPassword) {
          _addError(error: kMatchPassError);
          return false;
        }
      }
    }
    return true;
  }

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


}