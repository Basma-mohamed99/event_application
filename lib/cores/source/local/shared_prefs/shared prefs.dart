import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs ;
  static void init()async{
    prefs = await SharedPreferences.getInstance();

  }
  static  setThememode(ThemeMode themeMode){
    prefs.setString("themeMode", themeMode.toString());
  }
  static ThemeMode getThemeMode(){
   String? value= prefs.getString("themeMode");
   return value=="ThemeMode.light"?ThemeMode.light:ThemeMode.dark;
  }

  }
