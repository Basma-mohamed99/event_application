import 'package:event_app/cores/constant/assets_manger.dart';
import 'package:event_app/cores/constant/routes_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AssetsManger.logo))
          .animate(onComplete: (controller) {
            Navigator.pushReplacementNamed(context, RoutesManger.startScreen);
          },).scale(duration: Duration(seconds: 2)).then()
          .fadeOut(duration: Duration(seconds: 2)),
    );
  }
}
