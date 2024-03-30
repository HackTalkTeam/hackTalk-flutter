import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/textstyle.dart';
import 'package:hack_talk/core/widgets/button_second_widget.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/custom_text_form_feild.dart';
import 'package:hack_talk/features/auth/logic/forget_password/forget_password_cubit/forget_password_cubit.dart';
import 'package:hack_talk/features/auth/screens/verfication/verfication.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is PasswordSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VerficationScreen(email: emailController.text)));
          } else if (state is PasswordFailedState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.msg,
                    style: const TextStyle(
                      color: Colors.white,
                    )),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            const CircularProgressIndicator();
          }
        },
        builder: (context, state) {
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
                child: Form(
                  key: formKey,
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
                        controller: emailController,
                        hintText: 'Email',
                        kbType: TextInputType.emailAddress,
                        lableText: 'Enter Your Email',
                        onChanged: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "email must not be empty";
                          }
                          return null;
                        },
                      ),
                      verticalSpace(10.h),
                      ButtonWidget(
                        AppStrings.send,
                        color: Colors.white,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .resetPassword(
                              email: emailController.text,
                            );
                          }
                        },
                      ),
                      verticalSpace(10.h),
                      ButtonSec(
                        text: AppStrings.cancel,
                        color: AppColors.mainBlueColor,
                        onPressed: () {
                          //AppRoutes.routeTo(context, const VerficationScreen());
                        },
                      )
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
