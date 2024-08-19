import 'package:flutter/material.dart';
import 'package:note_plus/core/theming/app_colors.dart';
import 'package:note_plus/core/theming/app_text_styles.dart';

ThemeData appThemeLight = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme:
      AppBarTheme(backgroundColor: AppColors.background, centerTitle: true),
  textTheme: TextTheme(
      displayLarge: AppTextStyle.font24WhiteBoldOpacity87,
      displayMedium: AppTextStyle.font16WhiteRegularOpacity87,
      displaySmall: AppTextStyle.font16WhiteRegularOpacity44),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);


ThemeData appThemeDark = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme:
      AppBarTheme(backgroundColor: AppColors.background, centerTitle: true),
  textTheme: TextTheme(
      displayLarge: AppTextStyle.font24WhiteBoldOpacity87,
      displayMedium: AppTextStyle.font16WhiteRegularOpacity87,
      displaySmall: AppTextStyle.font16WhiteRegularOpacity44),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
