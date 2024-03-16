import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/textstyle.dart';

// ignore: must_be_immutable
class NewToHachTalk extends StatelessWidget {
  NewToHachTalk(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.onTap});
  final String textOne;
  final String textTwo;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w),
      child: Row(
        children: [
          RichText(
              text: TextSpan(
            text: textOne,
            style: TextStyles.font12black,
          )),
          InkWell(
            onTap: onTap,
            child: RichText(
              text: TextSpan(
                text: textTwo,
                style: TextStyle(
                  color: AppColors.mainBlueColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
