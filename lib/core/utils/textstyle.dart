import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hack_talk/core/utils/app_colors.dart';

import 'FontWeightHelper.dart';

class TextStyles {
  static TextStyle font24mainBlueColor = TextStyle(
    fontSize: 20.sp,
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

  static TextStyle font12black = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Roboto',
    color: AppColors.doNotHaveAccount,
  );



   static TextStyle font16black = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Roboto',
    color: AppColors.black,
  );

  static TextStyle font20mainBllueColor = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'Roboto',
    color: AppColors.mainBlueColor,
  );
}
