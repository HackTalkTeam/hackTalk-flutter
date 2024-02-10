import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/textstyle.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/custom_text_form_feild.dart';
import 'package:hack_talk/features/auth/widgets/divider.dart';
import 'package:hack_talk/features/auth/widgets/do_not_have_an_account.dart';
import 'package:hack_talk/features/auth/widgets/social_icon.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();
  bool isObsecuretext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.h, vertical: 5.0.h),
          child: SingleChildScrollView(
            child:
                Form(
                  key: formkey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                verticalSpace(5.h),
                                Center(child: Image.asset('assets/images/signUp.png')),
                                Text(
                  AppStrings.createAccount,
                  style: TextStyles.font24mainBlueColor,
                                ),
                                Text(AppStrings.pleaseSignuptocontinueusingourapp,
                    style: TextStyles.font11black),
                                verticalSpace(10.h),
                                CustomTextFormFeild(
                  lableText: ' Name ',
                  hintText: AppStrings.name,
                  kbType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                  onChanged: (value) {},
                                ),
                                CustomTextFormFeild(
                  lableText: ' Email  ',
                  hintText: AppStrings.email,
                  kbType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                  onChanged: (value) {},
                                ),
                                CustomTextFormFeild(
                  lableText: ' Password ',
                  isObscureText: isObsecuretext,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObsecuretext = !isObsecuretext;
                      });
                    },
                    child: Icon(
                      isObsecuretext ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: AppStrings.name,
                  kbType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                  onChanged: (value) {},
                                ),
                                CustomTextFormFeild(
                  lableText: ' Conform Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObsecuretext = !isObsecuretext;
                      });
                    },
                    child: Icon(
                      isObsecuretext ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: AppStrings.name,
                  kbType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                  onChanged: (value) {},
                                ),
                                verticalSpace(10.h),
                                ButtonWidget(AppStrings.signUp,
                    color: Colors.white, onPressed: () {}),
                    verticalSpace(10.h),
                     const Center(child: Richtxt()),
                     const Div(),
                     const Social_icon(),
                  
                              ]),
                ),
          ),
        ),
      ),
    );
  }
}
