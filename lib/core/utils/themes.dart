import 'package:firebase_chat_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme(){
  return ThemeData(
    platform: TargetPlatform.iOS,
      useMaterial3: true,

      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.90),
          borderSide: BorderSide(width: 1, color: myGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),

          borderSide: BorderSide(width: 1, color: myWhite),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),

          borderSide: BorderSide(width: 1, color: myWhite),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),

          borderSide: BorderSide(width: 1, color: myRed),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),

          borderSide: BorderSide(width: 1, color: myWhite),
        ),
      ),

      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: myBlue,
        onPrimary: myWhite,
        secondary: myWhite,
        onSecondary: myWhite,
        primaryContainer:myWhite,
        error: myRed,
        onError: myRed,
        background:myWhite,
        onBackground: myWhite,
        surface: myWhite,
        onSurface: myWhite,
      ),
      scaffoldBackgroundColor: myBlack,
      // colorScheme: const ColorScheme.dark(),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: myWhite),
        titleTextStyle: TextStyle(color: myWhite, fontSize: 16),
        elevation: 0,
        backgroundColor: myBlack,
      ),
      iconTheme: IconThemeData(
          color: myWhite
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: myRed,
          enableFeedback: true,
          selectedLabelStyle: const TextStyle(fontSize: 16),
          selectedItemColor: Colors.grey));
}

ThemeData lightTheme(){
  return ThemeData(
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.90),
          borderSide: BorderSide(width: 1, color: myGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),

          borderSide: BorderSide(width: 1, color: myBlack),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),

          borderSide: BorderSide(width: 1, color: myBlack),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),

          borderSide: BorderSide(width: 1, color: myRed),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),

          borderSide: BorderSide(width: 1, color: myBlack),
        ),
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: myBlue,
        onPrimary: myBlack,
        secondary: myBlack,
        onSecondary: myBlack,
        primaryContainer:myBlack,
        error: myRed,
        onError: myRed,
        background:myBlack,
        onBackground: myBlack,
        surface: myBlack,
        onSurface: myBlack,
      ),
      scaffoldBackgroundColor: myWhite,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: myGrey),
        titleTextStyle: TextStyle(color: myGrey, fontSize: 20),
        elevation: 0,
        backgroundColor: myRed,
      ),
      iconTheme: IconThemeData(
          color: myBlack
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: myRed,
          enableFeedback: true,
          selectedLabelStyle: const TextStyle(fontSize: 16),
          selectedItemColor: myGrey));
}