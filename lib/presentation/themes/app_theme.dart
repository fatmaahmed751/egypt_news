import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    primarySwatch: AppColors.PRIMARY,
    scaffoldBackgroundColor: AppColors.WHITE,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    textTheme: const TextTheme(
      caption: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.GREY,
      ),
      headline3: const TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: AppColors.WHITE,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.WHITE,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: AppColors.PRIMARY,
      ),
      textTheme: TextTheme(
        headline6: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.PRIMARY,
          fontSize: 20.0,
        ),
      ),
    ),
  );
}
