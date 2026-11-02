
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_provider.dart';
import '../constant/assets_manger.dart';
import '../constant/colors_manger.dart';
import '../source/local/shared_prefs/shared prefs.dart';
class CustomToggle extends StatefulWidget {
 final bool isIconsOFTheme;
 const CustomToggle({this.isIconsOFTheme=false}) ;
  @override
  State<CustomToggle> createState() => _CustomToggleState();
}
class _CustomToggleState extends State<CustomToggle> {
  int selectedOfthemes = 0;
  int selectedOfLang = 0;
  Color colorOfMoon=ColorsManger.primary;
  ThemeMode themeMode=ThemeMode.light;
  @override
  void initState() {
    super.initState();
    var value= SharedPrefs.getThemeMode();
   if(value==ThemeMode.dark){
     selectedOfthemes=1;
   }
   else{
     selectedOfthemes=0;
   }
  }
  @override
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider=Provider.of<ThemeProvider>(context);;
    List<Widget> iconsLanguage = [
      SvgPicture.asset(AssetsManger.english, width: 30),
      SvgPicture.asset(AssetsManger.arabic, width: 30),
    ];
    List<Widget> iconsTheme = [
      SvgPicture.asset(AssetsManger.sun, width: 30,
        colorFilter:ColorFilter.mode( selectedOfthemes == 1
            ? ColorsManger.primary: ColorsManger.whiteForLightMode, BlendMode.srcIn) ,
      ),
      SvgPicture.asset(AssetsManger.moon, width: 30,
        colorFilter:ColorFilter.mode( selectedOfthemes == 1
            ? ColorsManger.whiteForLightMode  : ColorsManger.primary, BlendMode.srcIn) ,
      ),


    ];
    return AnimatedToggleSwitch<int>.rolling(
          onChanged: (value) {
            if (widget.isIconsOFTheme) {
              setState(() {
                selectedOfthemes = value;
                themeMode = value == 1 ? ThemeMode.dark : ThemeMode.light;
              });

              provider.changeThemeMode(themeMode);
              SharedPrefs.setThememode(themeMode);
            } else {
              setState(() {
                selectedOfLang = value;
              });

              context.setLocale(
                value == 1 ? const Locale("ar") : const Locale("en"),
              );
            }
          },
        iconOpacity: 1,
        spacing: 16,
        style: ToggleStyle(
          backgroundColor: Colors.transparent,
          borderColor: ColorsManger.primary,
          indicatorColor: ColorsManger.primary,
        ),
        current: widget.isIconsOFTheme
            ? selectedOfthemes
            : (context.locale.languageCode == 'ar' ? 1 : 0),
        values: [0, 1],
        iconList: widget.isIconsOFTheme?iconsTheme:iconsLanguage
    );
  }
}