
// 儲存資料的種類
import 'package:shared_preferences/shared_preferences.dart';

enum ValueType {
  BOOL,
  INT,
  STRING,
  DOUBLE,
  STRING_LIST
}

// Key
enum SharePreferenceKey {
  user,
  email,
  accessToken
}

// 擴張 Key
extension KeyExtension on SharePreferenceKey {

  // 產生相對應的 Key 字串
  String get key => this.toString();

  // 設定 Key 儲存的 data type
  ValueType get valueType {
    switch (this) {
      case SharePreferenceKey.user:
        return ValueType.STRING;

      case SharePreferenceKey.email:
        return ValueType.STRING;

      case SharePreferenceKey.accessToken:
        return ValueType.STRING;
    }
  }
}

class SharePreferenceManager {

  // await SharePreferenceManager.set(SharePreferenceKey.email, email);
  static set (SharePreferenceKey key, dynamic value) async {

    SharedPreferences _preferences = await SharedPreferences.getInstance();

    switch (key.valueType) {

      case ValueType.BOOL:
        _preferences.setBool(key.key, value);
        break;

      case ValueType.INT:
        _preferences.setInt(key.key, value);
        break;

      case ValueType.STRING:
        _preferences.setString(key.key, value);
        break;

      case ValueType.DOUBLE:
        _preferences.setDouble(key.key, value);
        break;

      case ValueType.STRING_LIST:
        _preferences.setStringList(key.key, value);
        break;
    }
  }

  // await SharePreferenceManager.get(SharePreferenceKey.email);
  static dynamic get(SharePreferenceKey key) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.get(key.key);
  }

  // remove all SharedPreferences Data
  static void removeAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}