import 'package:flutter/material.dart';
import 'package:khanakhazana/global/theme/appallate.dart';

enum Apptheme { darktheme, lighttheme, amoledDarkTheme }

final appthemeData = {
  Apptheme.darktheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(24, 24, 32, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(24, 24, 32, 1),
    appBarTheme: const AppBarTheme(
      color: Color.fromRGBO(24, 24, 32, 1),
    ),
    // colorScheme: ColorScheme.dark(
    //   primary: Color.fromRGBO(24, 24, 32, 1),)
  ),
  Apptheme.lighttheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Appallete.whiteColor,
    scaffoldBackgroundColor: Appallete.whiteColor,
    appBarTheme: const AppBarTheme(
      color:Appallete.whiteColor,
    ),
     inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      filled: false, // we can dete this it upon to us
      fillColor: Colors.grey[900],
      hintStyle: const TextStyle(color: Colors.black),
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: border(),
      focusedBorder: border(Appallete.gradient2),
    ),
    textTheme: const TextTheme(titleMedium: TextStyle(color: Appallete.titleMediumtexttheme),)

  
  ),
  Apptheme.amoledDarkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,

    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Appallete.whiteColor),
      bodyMedium: TextStyle(color:Appallete.whiteColor),
      displayLarge: TextStyle(color: Appallete.whiteColor),
      displayMedium: TextStyle(color:Appallete.whiteColor),
      displaySmall: TextStyle(color: Appallete.whiteColor),
      titleLarge: TextStyle(color: Colors.white70),
      titleMedium: TextStyle(color: Appallete.titleMediumtexttheme),
      titleSmall: TextStyle(color: Appallete.whiteColor),
      // button: TextStyle(color: Colors.white),
      // caption: TextStyle(color: Colors.white70),
      // overline: TextStyle(color: Colors.white70),
    ),
    iconTheme: const IconThemeData(
      color: Appallete.whiteColor,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey[800],
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey[800],
      foregroundColor:Appallete.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      filled: true, // we can dete this it upon to us
      fillColor: Colors.grey[900],
      hintStyle: const TextStyle(color: Colors.white70),
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: border(),
      focusedBorder: border(Appallete.gradient2),
    ),
  )
};

OutlineInputBorder border([Color color = Appallete.borderColor]) =>
    OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: color,
      ),
      borderRadius: BorderRadius.circular(20),
    );
