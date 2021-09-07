
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/share_preference_manager.dart';

class ProfileMenuViewModel extends ChangeNotifier {

  void signOut() async {
    print("SignOut");
    await FirebaseAuth.instance.signOut();
    SharePreferenceManager.removeAll();
  }
}