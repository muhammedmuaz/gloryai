import 'package:flutter/material.dart';
import '../const/design_const.dart';

class GloyAiTheme {
  static ThemeData lightTheme = ThemeData(
    // scaffoldBackgroundColor: DesignConstants.kWhiteColor,
    //color theme
    primaryColor: DesignConstants.kPrimaryColor, // contrast to color white in entire app
    primaryColorDark: const Color(0xff00B3B3),
    primaryColorLight: const Color(0xffF3F6F9), //used in textfield
    disabledColor: Colors.redAccent, // used as disabled color for primary color
    secondaryHeaderColor: const Color(0xff00B3B3),
    // used in the
    colorScheme: ColorScheme.fromSeed(
      seedColor: DesignConstants.kPrimaryColor,
      primary: DesignConstants.kPrimaryColor,
      secondary: DesignConstants.kSecondaryColor,
      error: Colors.red,
    ),
    // font family
    fontFamily: 'Century', // Set your desired font family here

    // text theme for your app
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontFamily: 'Century', 
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Century', 
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Century',
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Century',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Century',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Century',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Century',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Century', 
        fontWeight: FontWeight.w500, 
        fontSize: 13,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Century',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Century',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        letterSpacing: 0.6,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Century',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Century',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    // Set check box theme
    radioTheme: RadioThemeData(
      splashRadius: 0,
      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return DesignConstants.kPrimaryColor; // Color for selected radio button
        } else {
          return Colors.black; // Color for unselected radio button
        }
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return DesignConstants.kPrimaryColor; // Color when checkbox is checked
          }
          return Colors.black; // Color when checkbox is unchecked
        },
      ),
      side: WidgetStateBorderSide.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return const BorderSide(
              color: DesignConstants.kPrimaryColor,
              width: 1.0,
            );
          }
          return const BorderSide(
            color: Colors.black,
            width: 1.0,
          );
        },
      ),
    ),
  );
}
