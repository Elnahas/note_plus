import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_plus/core/helpers/extentions.dart';
import '../../app/app_cubit.dart';
import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import 'app_label_text.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final String? labelText;
  final bool? isObscureText;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;

  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.isObscureText,
      this.suffixIcon,
      this.prefixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator,
      this.readOnly,
      this.maxLines,
      this.keyboardType,
      this.maxLength,
      this.inputFormatters,
      this.onTap,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!labelText.isNullOrEmpty()) ...[
          AppLabelText(
            labelText: labelText!,
          ),
          verticalSpace(10),
        ],
        TextFormField(
          onTap: onTap,
          readOnly: readOnly ?? false,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          inputFormatters:
              keyboardType != null && keyboardType == TextInputType.phone
                  ? [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ]
                  : inputFormatters,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                    borderSide:  BorderSide(
                        color: AppColors.primary, width: 0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderSide:  BorderSide(
                        color: AppColors.gray, width: 0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: Colors.red, width: 0.8),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(color: Colors.red, width: 0.8)),
              hintStyle: hintStyle ?? Theme.of(context).textTheme.displayMedium,
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              filled: true,
              fillColor:backgroundColor ?? (context.read<AppCubit>().isDark ? AppColors.dark : Colors.white),
              
              ),
          obscureText: isObscureText ?? false,
          style: Theme.of(context).textTheme.displayMedium,
          validator: (value) {
            return validator(value);
          },
        ),
      ],
    );
  }
}
