import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreferences ;

  static init() async{
    sharedPreferences = await SharedPreferences.getInstance() ;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool getBool(String key)  {
    return  sharedPreferences.getBool(key);
  }


  static Future<bool> setData(String key, dynamic value) async{ //de hatsahhel 3lya wna b3ml save lel data eni kda kda hb3t el value dynamic w h3ml check 3leh w 3la asaso hshof hst5dm anhy set mn el sharedpef
    if(value is String) return await sharedPreferences.setString(key, value);
    if(value is int) return await sharedPreferences.setInt(key, value);
    if(value is double) return await sharedPreferences.setDouble(key, value);
     return await sharedPreferences.setBool(key, value);
  }

  static Object getData(String key) {
    return  sharedPreferences.get(key);
  }

  static Future<bool> removeData(String key)async{
    return await sharedPreferences.remove(key);
  }
}