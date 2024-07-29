import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.dark;
String appLanguage="en";
  getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isDark");
    if(isDark!=null){
      if(isDark==true){
        mode=ThemeMode.dark;
      }else{
        mode=ThemeMode.light;
      }
      notifyListeners();
    }
  }
  getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? isEnglish =prefs.getString("isEnglish");
    if(isEnglish!=null){
      if(isEnglish=="en"){
        appLanguage="en";
      }else{
        appLanguage="ar";
      }
      notifyListeners();
    }
  }


  changeLanguage(String newLanguage)async{
    if(appLanguage==newLanguage){
      return;
    }
    appLanguage=newLanguage;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("isEnglish", appLanguage);
    notifyListeners();
  }

  Future<void>changeTheme(ThemeMode themeMode) async {
    if (mode == themeMode) {
      return;
    }
    mode = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", mode == ThemeMode.dark);
    notifyListeners();
  }

  bool isDark() {
    return mode == ThemeMode.dark;
  }
}
