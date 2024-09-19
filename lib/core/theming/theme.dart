import 'package:flutter/material.dart';
import 'package:note_plus/core/theming/app_colors.dart';
import 'package:note_plus/core/theming/app_text_styles.dart';

ThemeData appThemeLight = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.black), 
  ),
  textTheme: TextTheme(
    displayLarge: AppTextStyle.font24WhiteBoldOpacity87.copyWith(color: Colors.black),
    displayMedium: AppTextStyle.font16WhiteRegularOpacity87.copyWith(color: Colors.black),
    displaySmall: AppTextStyle.font16WhiteRegularOpacity44.copyWith(color: Colors.black),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

ThemeData appThemeDark = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.white), 
  ),
  textTheme: TextTheme(
    displayLarge: AppTextStyle.font24WhiteBoldOpacity87,
    displayMedium: AppTextStyle.font16WhiteRegularOpacity87,
    displaySmall: AppTextStyle.font16WhiteRegularOpacity44,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);