import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/textstyle.dart';
import 'package:hack_talk/core/widgets/button_second_widget.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/custom_text_form_feild.dart';
import 'package:hack_talk/features/auth/load/load_screen.dart';
import 'package:hack_talk/features/auth/verfication/verfication.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('logo'),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset('assets/svgs/reset.svg'),
              Text(
                AppStrings.resetPassword,
                style: TextStyles.font20mainBllueColor,
              ),
              Text(
                AppStrings.resetPasswordText,
                textAlign: TextAlign.center,
                style: TextStyles.font12black,
              ),
              verticalSpace(20.h),
              CustomTextFormFeild(
                controller: TextEditingController(),
                hintText: 'New Password',
                kbType: TextInputType.visiblePassword,
                lableText: 'Enter Your New Password',
                onChanged: (value) {},
              ),
              verticalSpace(10.h),
              CustomTextFormFeild(
                controller: TextEditingController(),
                hintText: 'Confirm Password',
                kbType: TextInputType.visiblePassword,
                lableText: 'Confirm Your Password',
                onChanged: (value) {},
              ),
              verticalSpace(10.h),
              ButtonWidget(
                AppStrings.reset,
                color: Colors.white,
                onPressed: () {
                  AppRoutes.routeTo(context, const LoadScreen());
                },
              ),
              verticalSpace(10.h),
              ButtonSec(
                text: AppStrings.cancel,
                color: AppColors.mainBlueColor,
                onPressed: () {
                  AppRoutes.routeTo(context, const VerficationScreen());
                },
              )
            ],
          ),
        ),
      ))
    );
  }
}