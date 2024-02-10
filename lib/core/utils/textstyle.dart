import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/font.dart';

class TextStyles {
  static TextStyle font24mainBlueColor = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Roboto',
    color: AppColors.mainBlueColor,
  );

  static TextStyle font11black = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Roboto',
    color: AppColors.black,
  );
}
