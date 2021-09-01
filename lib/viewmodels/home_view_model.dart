
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/models/home_banner_model.dart';

class HomeViewModel extends ChangeNotifier {
  
  late HomeBannerModel _homeBanner = HomeBannerModel(discountBanners: [], topBanners: []);
  HomeBannerModel get homeBanner => _homeBanner;
  void getHomeBannerInFirebase() {

    // print("getHomeBannerInFirebase");
    FirebaseFirestore.instance.collection('home_page').doc('banners').get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic>? jsonData;
        jsonData = documentSnapshot.data() as Map<String, dynamic>?;
        _homeBanner = HomeBannerModel.fromJson(jsonData!);
        notifyListeners();
      } else {
        print('not exist');
      }
    });
  }
  
  Future<String> getTopBannerImageInFirebase(String path) async {
    try {
      String result = await FirebaseStorage.instance.ref(path).getDownloadURL();
      print(result);
      return Future.value(result);
    } on FirebaseException catch (e) {
      print(e.code);
    } catch (e) {
      print(e);
    }

    return Future.value("");
  }
}