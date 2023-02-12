import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceInit {
  static late SharedPreferences prefs;
  static Future<void> initSharePrefrence() async {
    prefs = await SharedPreferences.getInstance();
  }
}
