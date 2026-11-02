import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cores/source/local/shared_prefs/shared prefs.dart';

class ThemeProvider  extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.light;
  init (){
     themeMode=SharedPrefs.getThemeMode();
  }
 void changeThemeMode(ThemeMode themeMode){
    this.themeMode=themeMode; //
    notifyListeners();
  }

}

