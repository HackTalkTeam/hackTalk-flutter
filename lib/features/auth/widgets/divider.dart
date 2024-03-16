import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_strings.dart';

class Div extends StatelessWidget {
  const Div({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        verticalSpace(5.h),
        SizedBox(
          width: 100.w,
          child: const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        horizontalSpace(3.w),
        Text(
          AppStrings.or,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: 14.sp,
          ),
        ),
        horizontalSpace(3.w),
        SizedBox(
          width: 100.w,
          child: const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
