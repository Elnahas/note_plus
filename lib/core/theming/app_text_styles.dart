import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_plus/core/helpers/font_weight_helper.dart';
import 'package:note_plus/core/theming/app_colors.dart';

abstract class AppTextStyle {
  static TextStyle get font16WhiteRegular => GoogleFonts.lato(
      color: AppColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular);

  static TextStyle get font16WhiteBold => GoogleFonts.lato(
      color: AppColors.white,
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold);

  static TextStyle get font16WhiteRegularOpacity44 => GoogleFonts.lato(
      color: AppColors.white.withOpacity(0.44),
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular);

  static TextStyle get font32WhiteBoldOpacity87 => GoogleFonts.lato(
      color: AppColors.white.withOpacity(0.87),
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold);

  static TextStyle get font24WhiteBoldOpacity87 => GoogleFonts.lato(
      color: AppColors.white.withOpacity(0.87),
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold);

  static TextStyle get font16WhiteBoldOpacity87 => GoogleFonts.lato(
      color: AppColors.white.withOpacity(0.87),
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.bold);

        static TextStyle get font16WhiteRegularOpacity87 => GoogleFonts.lato(
      color: AppColors.white.withOpacity(0.87),
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular);

  static TextStyle get font20WhiteRegularOpacity87 => GoogleFonts.lato(
      color: AppColors.white.withOpacity(0.87),
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.regular);
}
