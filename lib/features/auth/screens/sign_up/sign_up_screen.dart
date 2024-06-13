import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/textstyle.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/custom_text_form_feild.dart';
import 'package:hack_talk/features/auth/logic/register/register_cubit.dart';
import 'package:hack_talk/features/auth/screens/login/login_screen.dart';
import 'package:hack_talk/features/auth/widgets/divider.dart';
import 'package:hack_talk/features/auth/widgets/rich_text.dart';
import 'package:hack_talk/features/auth/widgets/social_icon.dart';
import 'package:hack_talk/features/home/presentation/screen/home/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObsecuretext = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AppRoutes.routeAndRemoveAllTo(context, const HomeScreen());
            });
          } else if (state is RegisterFailedState) {
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
              forceMaterialTransparency: true,
              title: SvgPicture.asset('hacktalk'.getSvgAsset),
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.h),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(5.h),
                          Center(
                              child: Image.asset('assets/images/signUp.png')),
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
                            kbType: TextInputType.name,
                            controller: nameController,
                            onChanged: (value) {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return "name must not be empty";
                              }
                              return null;
                            },
                          ),
                          CustomTextFormFeild(
                            lableText: ' Email  ',
                            hintText: AppStrings.email,
                            kbType: TextInputType.emailAddress,
                            controller: emailController,
                            onChanged: (value) {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return "email must not be empty";
                              }
                              return null;
                            },
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
                                isObsecuretext
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: AppStrings.password,
                            kbType: TextInputType.number,
                            controller: passwordController,
                            onChanged: (value) {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return "password must not be empty";
                              }
                              return null;
                            },
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
                                isObsecuretext
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: AppStrings.password,
                            kbType: TextInputType.number,
                            controller: confirmPasswordController,
                            onChanged: (value) {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Conform Password must not be empty";
                              }
                              return null;
                            },
                          ),
                          verticalSpace(10.h),
                          ButtonWidget(AppStrings.signUp, color: Colors.white,
                              onPressed: () {
                            if (formKey.currentState!.validate()) {
                              log(nameController.text);
                              BlocProvider.of<RegisterCubit>(context).register(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  password_confirmation:
                                      confirmPasswordController.text);
                            }
                          }),
                          verticalSpace(10.h),
                          NewToHachTalk(
                            textOne: AppStrings.donothaveanAccount,
                            onTap: () {
                              AppRoutes.routeAndRemoveAllTo(
                                  context, const LoginScreen());
                            },
                            textTwo: AppStrings.login,
                          ),
                          const Div(),
                          const Social_icon(),
                        ]),
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
