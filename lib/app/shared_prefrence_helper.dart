import 'package:news_app_figma/app/shared_prefrence_call.dart';
import 'package:news_app_figma/constants/shared_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceHelper {
  static setCountry(String country) {
    final SharedPreferences prefs = SharedPrefrenceInit.prefs;
    prefs.setString(SharedPrefrenceConstant.country, country);
  }

  static String getCountry() {
    final SharedPreferences prefs = SharedPrefrenceInit.prefs;
    return prefs.getString(SharedPrefrenceConstant.country) ?? '';
  }

  static setCategory(String category) {
    final SharedPreferences prefs = SharedPrefrenceInit.prefs;
    prefs.setString(SharedPrefrenceConstant.category, category);
  }

  static getCategory() {
    final SharedPreferences prefs = SharedPrefrenceInit.prefs;
    return prefs.getString(SharedPrefrenceConstant.category) ?? '';
  }
}
