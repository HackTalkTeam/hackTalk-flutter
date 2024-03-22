import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/textstyle.dart';
import 'package:hack_talk/core/widgets/button_second_widget.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/features/auth/logic/forget_password/forget_password_cubit/forget_password_cubit.dart';
import 'package:hack_talk/features/auth/screens/reset/reset_screen.dart';
import 'package:hack_talk/features/auth/widgets/otp_screen.dart';

class VerficationScreen extends StatelessWidget {
  VerficationScreen({super.key, required this.email});

  final firstOtpController = TextEditingController();
  final secondOtpController = TextEditingController();
  final thirdOtpController = TextEditingController();
  final fourthOtpController = TextEditingController();
  final fifthOtpController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final String email;
  String code = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is PasswordSuccessState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResetScreen(
                          email: email,
                          token: code,
                        )));
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
              leading: const BackButton(),
              title: const Text('logo'),
            ),
            body: SafeArea(
              child: Padding(
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
                      Form(
                        key: formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Otp(
                              controller: firstOtpController,
                              validator: (value) {
                                if (value!.length != 1) {
                                  return '';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            Otp(
                              controller: secondOtpController,
                              validator: (value) {
                                if (value!.length != 1) {
                                  return '';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            Otp(
                              controller: thirdOtpController,
                              validator: (value) {
                                if (value!.length != 1) {
                                  return '';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            Otp(
                              controller: fourthOtpController,
                              validator: (value) {
                                if (value!.length != 1) {
                                  return '';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            Otp(
                              controller: fifthOtpController,
                              validator: (value) {
                                if (value!.length != 1) {
                                  return '';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(20.h),
                      InkWell(
                        onTap: () {
                          AppRoutes.routeTo(
                              context,
                              ResetScreen(
                                email: email,
                                token: code,
                              ));
                        },
                        child: Text.rich(TextSpan(
                            text: AppStrings.doNot,
                            style: TextStyles.font12black,
                            children: const [
                              TextSpan(
                                text: AppStrings.resend,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.mainBlueColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ])),
                      ),
                      verticalSpace(10.h),
                      ButtonWidget(
                        AppStrings.verify,
                        color: Colors.white,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            code = firstOtpController.text +
                                secondOtpController.text +
                                thirdOtpController.text +
                                fourthOtpController.text +
                                fifthOtpController.text;
                          }
                        },
                      ),
                      verticalSpace(10.h),
                      ButtonSec(
                        text: AppStrings.resend,
                        color: AppColors.mainBlueColor,
                        onPressed: () {
                          AppRoutes.routeTo(
                              context,
                              VerficationScreen(
                                email: email,
                              ));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
