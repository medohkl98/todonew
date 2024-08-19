

import 'package:flutter/material.dart';

class AppThemeMngr{
static Color primaryMainColor=const Color(0xff5D9CEC);
   static    ThemeData lightTheme= ThemeData(
     primaryColor: primaryMainColor ,
    scaffoldBackgroundColor:  const Color(0xFFDFECDB),
     appBarTheme: const AppBarTheme(

       backgroundColor: Colors.transparent,
       titleTextStyle:TextStyle(
         fontFamily: "Poppins",
         fontSize: 20,
         fontWeight: FontWeight.bold,
         color: Colors.white,
       ),
     ),
     textTheme: const TextTheme(
         titleLarge: TextStyle(
           fontFamily: "Poppins",
           fontSize: 30,
           fontWeight: FontWeight.bold,
           color: Colors.white,
           //color:  Colors.black,
         ),
         bodyLarge: TextStyle(
           fontFamily: "Poppins",
           fontSize: 25,
           fontWeight: FontWeight.w500,
           color: Colors.white,
         ),
         bodyMedium: TextStyle(
           fontFamily: "Poppins",
           fontSize: 25,
           fontWeight: FontWeight.w400,
           color: Colors.white,
         ),
         bodySmall: TextStyle(
             fontFamily: "Poppins",
             fontSize: 20,
             fontWeight: FontWeight.bold,
            color: Colors.white,
         ),

         displaySmall: TextStyle(
           fontFamily: "Poppins",
           fontSize: 12,
           fontWeight: FontWeight.w400,
           color: Colors.grey,
         )
     ),
  );
}