import 'package:flutter/services.dart';

import '../../index.dart';
import '../util/constants.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Constants.mainColor,
    brightness: Brightness.light,
    secondary: Constants.mainColor,
  ),
  iconTheme: IconThemeData(
    color: Constants.mainColor,
  ),
  scaffoldBackgroundColor: Colors.transparent,
  fontFamily: Constants.fontFamily,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light,
    ),
    iconTheme: IconThemeData(
      color: Constants.mainColor,
    ),
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w800,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    headline5: TextStyle(
      fontWeight: FontWeight.w700,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      color: Colors.black,
    ),
  ),
);
