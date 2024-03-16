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
import 'package:hack_talk/features/auth/screens/reset/reset_screen.dart';
import 'package:hack_talk/features/auth/widgets/otp_screen.dart';

class VerficationScreen extends StatelessWidget {
  const VerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('logo'),
      ),
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset('assets/svgs/verification.svg'),
              Text(
                AppStrings.verification,
                style: TextStyles.font20mainBllueColor,
              ),
              Text(
                AppStrings.verificationText,
                textAlign: TextAlign.center,
                style: TextStyles.font12black,
              ),
              verticalSpace(20.h),
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Otp(),
              Otp(),
              Otp(),
              Otp(),
              Otp(),
              ],
             ),
             verticalSpace(20.h),
             InkWell(
                onTap: () {
                  AppRoutes.routeTo(context, const ResetScreen());
                },
               child: Text.rich(
                 TextSpan(
                   text: AppStrings.doNot,
                   style: TextStyles.font12black,
                   children: const [
                     TextSpan(
                       text: AppStrings.resend,
                       style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.mainBlueColor,
                        fontWeight: FontWeight.bold
                       ),
                       
                     )
                   ]
                 )),
             )  ,
              verticalSpace(10.h),
              ButtonWidget(
                AppStrings.verify,
                color: Colors.white,
                onPressed: () {
                  AppRoutes.routeTo(context, const ResetScreen());
                },
              ),
              verticalSpace(10.h),
              ButtonSec(
                text: AppStrings.resend,
                color: AppColors.mainBlueColor,
                onPressed: () {
                  AppRoutes.routeTo(context, const VerficationScreen());
                },
              )
              
            ],
          ),
        ),
      ),),
    );
  }
}