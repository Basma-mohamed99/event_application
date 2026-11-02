import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/cores/constant/app_style.dart';
import 'package:event_app/cores/constant/routes_manger.dart';
import 'package:event_app/provider/theme_provider.dart';
import 'package:event_app/provider/userProvider.dart';
import 'package:event_app/screens/forget_password_screen/forget_password_screen.dart';
import 'package:event_app/screens/home_screen/home_screen.dart';
import 'package:event_app/screens/login_screen/login_screen.dart';
import 'package:event_app/screens/on_bording_screen/on_bording_screen.dart';
import 'package:event_app/screens/register_screen/register_screen.dart';
import 'package:event_app/screens/splash_screen/splash_screen.dart';
import 'package:event_app/screens/start_screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'cores/source/local/shared_prefs/shared prefs.dart';
import 'firebase_options.dart';

void main()async { 

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPrefs.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( EasyLocalization(
    startLocale: Locale('ar'),
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child:  ChangeNotifierProvider(
        create: (context) => ThemeProvider()..init(),
          child: MyApp())
  ,
      ));
}
ThemeMode themeMode = ThemeMode.light;

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider=Provider.of<ThemeProvider>(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppStyle.lightMode,
      darkTheme: AppStyle.darkTheme,
      themeMode: provider.themeMode,
      routes: {
        RoutesManger.splash: (_) => const SplashScreen(),
        RoutesManger.onBoarding: (_) => const OnBordingScreen(),
        RoutesManger.login: (_) => const LoginScreen(),
        RoutesManger.register: (_) => const RegisterScreen(),
        RoutesManger.forgetPassword: (_) => const ForgetPasswordScreen(),
        RoutesManger.home: (_) => ChangeNotifierProvider(create: (context) => Userprovider(),
            child: const HomeScreen()),
        RoutesManger.startScreen: (_) => const StartScreen(),

      },

);

  }
}