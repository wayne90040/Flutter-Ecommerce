import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/share_preference_manager.dart';

class MyAccountEditViewModel extends ChangeNotifier {


  void setValueInFirebase({required String value}) {
    String email = SharePreferenceManager.get(SharePreferenceKey.email);

    try {
      CollectionReference user = FirebaseFirestore.instance.collection('users');

      user.doc(email).set(
          {
            'name': value
          }
      );
    } on FirebaseException catch (e) {

    }
  }
}