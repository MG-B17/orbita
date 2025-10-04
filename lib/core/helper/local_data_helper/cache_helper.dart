import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static Future<void> setStringData ({required String key , required dynamic value})async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  static Future<void> setBoolData ({required String key , required dynamic value})async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, value);
  }

  static Future<dynamic> getData ({required String key})async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key})async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    return await sharedPreferences.remove(key);
  }
}