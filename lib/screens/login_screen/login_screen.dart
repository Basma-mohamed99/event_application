import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/cores/constant/assets_manger.dart';
import 'package:event_app/cores/constant/routes_manger.dart';
import 'package:event_app/cores/reusable_compoents/custom_elevated_button.dart';
import 'package:event_app/cores/reusable_compoents/custom_field.dart';
import 'package:event_app/cores/reusable_compoents/cutom_toggle.dart';
import 'package:event_app/cores/reusable_compoents/dialog_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  String exceptions = " ";

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'
      ,
    );
    return Scaffold(resizeToAvoidBottomInset: true,
      body:
      SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(key: fromKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AssetsManger.logo)),
                CustomField(controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "empty data".tr();
                    }
                    if (!(emailRegex.hasMatch(value))) {
                      return "invalid email".tr();
                    }
                    return null;
                  },

                  hint: "email".tr(),
                  prefix: SvgPicture.asset(AssetsManger.email),),
                SizedBox(height: 16,),
                CustomField(
                  suffix: true,
                  controller: password,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "empty data".tr();
                    }
                    if (!(passwordRegex.hasMatch(value))) {
                      return "invalid email".tr();
                    }
                    return null;
                  },
                  hint: "Password".tr(),
                  prefix: SvgPicture.asset(AssetsManger.email),),
                TextButton(onPressed: () {},
                  child: Text("forgetPassword".tr()),

                ),
                CustomElevatedButton(text: "login".tr(), onTap: () {
                  if (fromKey.currentState!.validate()) {
                    signIn();
                  }
                },),
                Row(children: [
                  Text("dontHaveAccount".tr(), style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,),
                  TextButton(onPressed: () {
                    Navigator.pushNamed(context, RoutesManger.register);
                  }, child: Text("createAccount".tr()),)
                ],),
                Row(children: [
                  Expanded(child: Divider(color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                    thickness: 2, endIndent: 15, indent: 15,
                  )),
                  Text("or".tr()),
                  Expanded(child: Divider(color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                    thickness: 2, endIndent: 15, indent: 15,
                  )),
                ],),
                SizedBox(height: 16,),
                OutlinedButton(onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16)),
                        padding: EdgeInsets.symmetric(vertical: 16,)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AssetsManger.goglesvg),
                        SizedBox(width: 10,),
                        Text("loginWithGoogle".tr(), style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge,

                        ),

                      ],)),
                SizedBox(height: 16,),
                Center(child: CustomToggle())
              ],
            ),
          ),
        ),
      ),
    );
  }

  signIn() async {
    try {
      DialogUtils.showLoadingDialog(context);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text


      );
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, RoutesManger.home);
    } on FirebaseAuthException catch (e) {

      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        DialogUtils.showExptionDialog(context: context,
            message: "No user found for that email",
            messageOfButtonPostive: "ok",
            functionOfButtonPostive:  () =>   Navigator.pop(context));
      } else if (e.code == 'invalid-email') {
        DialogUtils.showExptionDialog(context: context,
            message: "'The email address is invalid.'",
            messageOfButtonPostive: "ok",
            functionOfButtonPostive:  () =>   Navigator.pop(context));
      } else if (e.code == 'wrong-password') {
        DialogUtils.showExptionDialog(context: context,
            message: 'Wrong password provided for that user.',
            messageOfButtonPostive: "ok",
            functionOfButtonPostive:  () =>   Navigator.pop(context));


      } else if (e.code == 'invalid-credential') {
        DialogUtils.showExptionDialog(context: context,
            message: 'The email or password is incorrect.',
            messageOfButtonPostive: "ok",
            functionOfButtonPostive:  () =>   Navigator.pop(context));
      } else {
        DialogUtils.showExptionDialog(context: context,
            message: ' ${e.message}',
            messageOfButtonPostive: "ok",
            functionOfButtonPostive:  () =>   Navigator.pop(context));
      }
    } catch (e) {
      Navigator.pop(context);
      DialogUtils.showExptionDialog(context: context,
          message: ' $e',
          messageOfButtonPostive: "ok",
          functionOfButtonPostive:  () =>   Navigator.pop(context));
    }
  }


}
