import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todonew/core/page_routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
 @override
 void initState() {
   super.initState();
   // Delay the navigation until after the current frame is drawn
   Timer(Duration(seconds: 2), () {

   //WidgetsBinding.instance.addPostFrameCallback((_) {
     Navigator.pushReplacementNamed(
       context,
       PageRoutesName.login,
     );

   }
   );
 }
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/imgs/splash_background.png",
      fit:BoxFit.cover );
  }
}
