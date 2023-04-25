import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

// AppTheme is a class containing static variables and methods related to the app's theme.
class AppTheme {
  // Static variables for colors used in the app's light theme.
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color(0xffff8900);
  static Color lightSecondaryColor = const Color(0xff040415);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightParticlesColor = const Color(0x44948282);
  static Color lightTextColor = Colors.black54;

  // Private constructor to prevent creating an instance of the class.
  const AppTheme._();

  // The light theme used in the app.
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: lightPrimaryColor,
      backgroundColor: lightBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(backgroundColor: lightPrimaryColor),
      colorScheme: ColorScheme.light(secondary: lightSecondaryColor),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: lightBackgroundColor)));

  // A method that returns the current system's brightness.
  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  // A method that sets the status bar and navigation bar colors based on the theme mode.
  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: lightBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}
