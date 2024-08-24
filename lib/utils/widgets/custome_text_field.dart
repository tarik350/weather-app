import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/config/constants/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Function(dynamic) onChanged;
  final String keyString;
  final String? errorText;
  final TextInputType inputType;
  final String? initialValue;
  final Widget? suffix;
  final TextEditingController controller;
  final Function(String)? onFieldSubmitted; // Added

  const CustomTextfield({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.onChanged,
    required this.keyString,
    required this.inputType,
    required this.errorText,
    required this.controller,
    this.suffix,
    this.onFieldSubmitted, // Added
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      key: Key(keyString),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted, // Added
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.h),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        fillColor: AppColors.primaryColor.withOpacity(.1),
        filled: true,
        labelText: hintText,
        labelStyle: TextStyle(
            color: Colors
                .grey.shade700), // Adjusted label color for better visibility
        errorText: errorText,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        suffixIcon: suffix,
      ),
    );
  }
}
