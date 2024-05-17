import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.title,
      required this.iconOne,
      required this.iconTwo,
      required this.onTap});
  final String title;
  final String iconOne;
  final String iconTwo;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 342.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: const Color(0xffF1F0E8),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Row(
            children: [
              SvgPicture.asset(iconOne),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff959595),
                    fontFamily: 'Roboto Flex'),
              ),
              const Spacer(),
              SvgPicture.asset(iconTwo),
            ],
          ),
        ),
      ),
    );
  }
}
