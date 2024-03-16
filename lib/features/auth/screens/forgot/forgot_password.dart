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
import 'package:hack_talk/features/auth/screens/verfication/verfication.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: const Text('logo'),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset('assets/svgs/forgot.svg'),
              Text(
                AppStrings.forgotPassword,
                style: TextStyles.font20mainBllueColor,
              ),
              Text(
                AppStrings.doNotWorry,
                textAlign: TextAlign.center,
                style: TextStyles.font12black,
              ),
              verticalSpace(20.h),
              CustomTextFormFeild(
                controller: TextEditingController(),
                hintText: 'Email',
                kbType: TextInputType.emailAddress,
                lableText: 'Enter Your Email',
                onChanged: (value) {},
              ),
              verticalSpace(10.h),
              ButtonWidget(
                AppStrings.send,
                color: Colors.white,
                onPressed: () {
                  AppRoutes.routeTo(context, const VerficationScreen());
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
      )),
    );
  }
}
