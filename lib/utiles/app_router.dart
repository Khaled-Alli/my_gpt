import 'package:flutter/material.dart';
import '../presentation/app_layout/screens/splash.dart';
import 'constants.dart';

class AppRouter {
  AppRouter();

  static Map<String, Widget Function(BuildContext)> routs = {
    // Constants.homeRout:(context)=>const HomeScreen(),
    Constants.splashRout: (context) => const SplashScreen(),
  };

  static void goTo(context, screen) {
    Navigator.pushNamed(
      context,
      screen,
    );
  }

  static void pop(context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  static void popAll(context) {
    Navigator.of(context).popUntil(ModalRoute.withName(Constants.homeRout));
  }

  static void goToWithReplacement(context, screen) {
    Navigator.pushReplacement(
      context,
      screen,
    );
  }
}
