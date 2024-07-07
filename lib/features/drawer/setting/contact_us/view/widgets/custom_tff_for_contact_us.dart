import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hack_talk/core/utils/app_colors.dart';

// class CustomTffForContactUs extends StatelessWidget {
//   const CustomTffForContactUs({
//     super.key,
//     required this.controller,
//   });
//   final TextEditingController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40.h,
//       width: double.infinity,
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
//           hintStyle: TextStyle(
//             color: const Color(0xff7A7A7A),
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w600,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(50.r),
//             borderSide: const BorderSide(color: AppColors.mainBlueColor),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(50.r),
//             borderSide: const BorderSide(color: AppColors.mainBlueColor),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(50.r),
//             borderSide: const BorderSide(color: AppColors.mainBlueColor),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(50.r),
//             borderSide: const BorderSide(color: AppColors.mainBlueColor),
//           ),
//         ),
//       ),
//     );
//   }
// }



class CustomTffForContactUs extends StatelessWidget {
  final validator;
  final TextEditingController controller;
  const CustomTffForContactUs({
    Key? key,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
          hintStyle: TextStyle(
            color: const Color(0xff7A7A7A),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: const BorderSide(color: AppColors.mainBlueColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: const BorderSide(color: AppColors.mainBlueColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: const BorderSide(color: AppColors.mainBlueColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: const BorderSide(color: AppColors.mainBlueColor),
          ),
        ),
      ),
    );
  }
}
