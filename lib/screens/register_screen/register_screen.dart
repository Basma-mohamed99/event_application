import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../cores/constant/assets_manger.dart';
import '../../cores/constant/routes_manger.dart';
import '../../cores/reusable_compoents/custom_elevated_button.dart';
import '../../cores/reusable_compoents/custom_field.dart';
import '../../cores/reusable_compoents/cutom_toggle.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../cores/reusable_compoents/dialog_utils.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController rePassword;
  late TextEditingController user;
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
    rePassword = TextEditingController();
    user = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    rePassword.dispose();
    user.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z][a-zA-Z0-9_]{2,15}$');


    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AssetsManger.logo)),
                CustomField(
                  controller: user,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "empty data".tr();
                    }
                    if (!(usernameRegex.hasMatch(value))) {
                      return "invalid email".tr();
                    }
                    return null;
                  },

                  hint: "Name".tr(),
                  prefix: SvgPicture.asset(AssetsManger.user),
                ),
                SizedBox(height: 16),

                CustomField(
                  controller: email,
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
                  prefix: SvgPicture.asset(AssetsManger.email),
                ),
                SizedBox(height: 16),
                CustomField(
                  controller: password,
                  suffix: true,

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
                  prefix: SvgPicture.asset(AssetsManger.email),
                ),
                SizedBox(height: 16),
                CustomField(
                  suffix: true,
                  controller: rePassword,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "empty data".tr();
                    }
                    if (rePassword.text!=password.text) {
                      return "the passwords must be the same".tr();
                    }
                    return null;
                  },

                  hint: "Re Password".tr(),
                  prefix: SvgPicture.asset(AssetsManger.email),
                ),
                SizedBox(height: 16),

                CustomElevatedButton(
                  text: "Create Account".tr(),
                  onTap: () {
                    if (fromKey.currentState!.validate()) {
                      createAccount();
                    }
                  },
                ),
                Row(
                  children: [
                    Text(
                      "AlreadyHaveAccount?".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesManger.login);
                      },
                      child: Text("Login".tr()),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                Center(child: CustomToggle()),
              ],
            ),
          ),
        ),
      ),
    );
  }
  createAccount() async {
    try {
      DialogUtils.showLoadingDialog(context);
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,

      );
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(context, RoutesManger.home,(route) => false,);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        DialogUtils.showExptionDialog(context: context,
            message: "'The password provided is too weak.''",
            messageOfButtonPostive: "ok",
            functionOfButtonPostive:  () =>   Navigator.pop(context));
      } else if (e.code == 'email-already-in-use') {
        DialogUtils.showExptionDialog(context: context,
            message: "'The account already exists for that email.'",
            messageOfButtonPostive: "ok",
            functionOfButtonPostive:  () =>   Navigator.pop(context));

      }

    }
    catch (e) {
      DialogUtils.showExptionDialog(context: context,
          message: ' $e',
          messageOfButtonPostive: "ok",
          functionOfButtonPostive:  () =>   Navigator.pop(context));

    }
  }
}
