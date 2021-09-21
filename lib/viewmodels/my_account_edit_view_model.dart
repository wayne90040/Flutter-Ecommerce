import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/share_preference_manager.dart';

class MyAccountEditViewModel extends ChangeNotifier {


  Future<bool> setValueInFirebase({required String value}) async {
    String email = await SharePreferenceManager.get(SharePreferenceKey.email);

    try {
      CollectionReference user = FirebaseFirestore.instance.collection('users');

      user.doc(email).set(
          {
            'name': value
          }
      );
      return Future.value(true);

    } on FirebaseException catch (e) {

    }

    return Future.value(false);
  }
}