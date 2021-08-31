
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/models/home_banner_model.dart';

class HomeViewModel extends ChangeNotifier {
  
  late HomeBannerModel _homeBanner;
  HomeBannerModel get homeBanner => _homeBanner;
  
  void getTopBannerInFirebase() {
    FirebaseFirestore.instance.collection('home_page').doc('banners').get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic>? jsonData;
        jsonData = documentSnapshot.data() as Map<String, dynamic>?;
        _homeBanner = HomeBannerModel.fromJson(jsonData!);

      } else {
        print('not exist');
      }
    });

  }
}