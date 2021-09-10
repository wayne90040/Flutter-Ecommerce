

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/models/my_account.dart';

class MyAccountViewModel extends ChangeNotifier {
  MyAccount? _myAccount;
  MyAccount? get myAccount => _myAccount;
  
  void getMyAccountInfoInFirebase() {
    FirebaseFirestore.instance.collection('users').doc('wayne90040@gmail.com').get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic>? jsonData = documentSnapshot.data() as Map<String, dynamic>?;
        _myAccount = MyAccount.fromJson(jsonData!);
        notifyListeners();
      } else {
        print('failed');
      }
    });
  }
}