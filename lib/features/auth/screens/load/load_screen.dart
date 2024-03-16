import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/textstyle.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/features/auth/screens/login/login_screen.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('logo'),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 80.h),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset('assets/svgs/succes.svg'),
                verticalSpace(20.h),
                Text(
                  AppStrings.success,
                  style: TextStyles.font20mainBllueColor,
                ),
                verticalSpace(20.h),
                Text(
                  AppStrings.loadingText,
                  textAlign: TextAlign.center,
                  style: TextStyles.font16black,
                ),
                verticalSpace(40.h),
                ButtonWidget(
                  AppStrings.login,
                  color: Colors.white,
                  onPressed: () {
                    AppRoutes.routeTo(context, const LoginScreen());
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}