import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/cores/constant/assets_manger.dart';
import 'package:event_app/cores/constant/colors_manger.dart';
import 'package:event_app/cores/constant/routes_manger.dart';
import 'package:event_app/cores/constant/string_manger.dart';
import 'package:event_app/cores/reusable_compoents/custom_elevated_button.dart';
import 'package:event_app/cores/reusable_compoents/cutom_toggle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Image.asset(AssetsManger.eventlAppbar),
      centerTitle: true,
    ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Image.asset(AssetsManger.start),
          Text(StringManger.personalizeYourExperience.tr(),
            style: TextStyle(
              color: ColorsManger.primary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 28,),
          Text(StringManger.chooseYourPreferredTheme.tr(),
            style:Theme.of(context).textTheme.bodyMedium ),
          SizedBox(height: 28,),
          Row(children: [
            Text(StringManger.language.tr(),
              style: TextStyle(

                color: ColorsManger.primary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            CustomToggle()
          ],),
          SizedBox(height: 19,),
          Row(children: [
            Text(StringManger.theme.tr(),
              style: TextStyle(
                color: ColorsManger.primary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            CustomToggle(isIconsOFTheme: true,),

          ],),
          Spacer(),
          CustomElevatedButton(text: StringManger.letsStart.tr(),
          onTap: () =>
          FirebaseAuth.instance.currentUser==null?
              Navigator.pushReplacementNamed(context,RoutesManger.login):
              Navigator.pushReplacementNamed(context,RoutesManger.home),
          ),
          SizedBox(height: 5,)


        ],),
      ),);
  }
}
