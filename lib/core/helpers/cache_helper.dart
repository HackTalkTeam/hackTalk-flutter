import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  Future<bool> setData(String key, dynamic value);
  dynamic getData(String key);
  Future<bool> remove(String key);
  Future<bool> clear();
}

class CacheHelperImp implements CacheHelper {
  final SharedPreferences sharedPref;
  CacheHelperImp({required this.sharedPref});

  @override
  dynamic getData(String key) {
    return sharedPref.get(key);
  }

  @override
  Future<bool> setData(String key, dynamic value) {
    if (value is int) {
      return sharedPref.setInt(key, value);
    } else if (value is bool) {
      return sharedPref.setBool(key, value);
    }
    if (value is double) {
      return sharedPref.setDouble(key, value);
    }
    if (value is List<String>) {
      return sharedPref.setStringList(key, value);
    }
    return sharedPref.setString(key, value.toString());
  }

  @override
  Future<bool> clear() {
    return sharedPref.clear();
  }

  @override
  Future<bool> remove(String key) {
    return sharedPref.remove(key);
  }
}
