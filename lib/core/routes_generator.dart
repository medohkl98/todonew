

import 'package:flutter/material.dart';
import 'package:todonew/core/page_routes_name.dart';
import 'package:todonew/modules/login/login_view.dart';
import 'package:todonew/modules/splash/splash_view.dart';

class RoutesGenerator {
  // static const String intial="/";
  // static const String login="login";
  static Route<dynamic> onGenerateRoutes(RouteSettings settings){
    switch (settings.name){
      case PageRoutesName.intial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
        case PageRoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: settings,
        );
      default: 
        return MaterialPageRoute(builder:
            (context) =>SplashView(),
            settings: settings
        );
    }
  }


}