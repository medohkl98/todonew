import 'package:flutter/material.dart';
import 'package:todonew/core/app_theme_manager.dart';
import 'package:todonew/core/page_routes_name.dart';
import 'package:todonew/core/routes_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'TODO APP',
      debugShowCheckedModeBanner: false,

      initialRoute: PageRoutesName.intial,
      theme: AppThemeMngr.lightTheme,

      onGenerateRoute: RoutesGenerator.onGenerateRoutes,
    );
  }
}



