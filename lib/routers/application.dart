import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application{
  static Router router;
  static SharedPreferences prefs;

  static Future initShared() async{
    prefs = await SharedPreferences.getInstance();
  }
}