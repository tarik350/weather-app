import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String lable;
  final Color backgroundColor;
  final double? padding;

  const CustomButton(
      {super.key,
      required this.onTap,
      required this.lable,
      this.padding,
      this.backgroundColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.r)))
            .copyWith(backgroundColor:
                WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return backgroundColor.withOpacity(.7);
          } else {
            return backgroundColor;
          }
        })).copyWith(),
        onPressed: onTap,
        child: Text(
          lable,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
