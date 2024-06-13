import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hack_talk/core/helpers/cache_helper.dart';
import 'package:hack_talk/core/helpers/spacing.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/textstyle.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/custom_text_form_feild.dart';
import 'package:hack_talk/features/auth/logic/login/login_cubit/login_cubit.dart';
import 'package:hack_talk/features/auth/screens/forgot/forgot_password.dart';
import 'package:hack_talk/features/auth/screens/sign_up/sign_up_screen.dart';
import 'package:hack_talk/features/auth/widgets/divider.dart';
import 'package:hack_talk/features/auth/widgets/rich_text.dart';
import 'package:hack_talk/features/auth/widgets/social_icon.dart';
import 'package:hack_talk/features/home/presentation/screen/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObsecuretext = true;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AppRoutes.routeAndRemoveAllTo(context, const HomeScreen());
            });
          } else if (state is LoginFailedState) {
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
                  padding: EdgeInsets.symmetric(
                      horizontal: 12.0.w, vertical: 10.0.h),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child:
                                  Image.asset('assets/images/Group 237.png')),
                          verticalSpace(16.h),
                          Text(
                            AppStrings.welcomBack,
                            style: TextStyles.font24mainBlueColor,
                          ),
                          Text(AppStrings.please,
                              style: TextStyles.font11black),
                          verticalSpace(16.h),
                          CustomTextFormFeild(
                            lableText: ' email ',
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
                          verticalSpace(16.h),
                          CustomTextFormFeild(
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
                            lableText: 'password',
                            hintText: AppStrings.password,
                            kbType: TextInputType.visiblePassword,
                            onChanged: (value) {},
                            controller: passwordController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "password must not be empty";
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: [
                              FlutterSwitch(
                                height: 20.0,
                                width: 40.0,
                                padding: 4.0,
                                toggleSize: 15.0,
                                borderRadius: 10.0,
                                activeColor: AppColors.mainBlueColor,
                                value: isSwitched,
                                onToggle: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                              ),
                              SizedBox(width: 10.w),
                              Text(AppStrings.rememberMe,
                                  style: TextStyles.font11black),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgotPassword(),
                                      ));
                                },
                                child: Text(
                                  AppStrings.forgotPassword,
                                  style: TextStyles.font11black,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(10.h),
                          ButtonWidget(
                            AppStrings.login,
                            color: Colors.white,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                              if (isSwitched == true) {
                                CacheHelper.saveData(
                                    key: AppStrings.token,
                                    value: LoginCubit()
                                        .loginModel!
                                        .data!
                                        .accessToken);
                                //CacheHelper.saveData(key: "email", value: emailController.text);
                                //CacheHelper.saveData(key: "password", value: passwordController.text);
                              }
                            },
                          ),
                          verticalSpace(10.h),
                          Center(
                              child: NewToHachTalk(
                            textOne: AppStrings.donothaveanAccount,
                            onTap: () {
                              AppRoutes.routeAndRemoveAllTo(
                                  context, const SignUpScreen());
                            },
                            textTwo: AppStrings.signUp,
                          )),
                          verticalSpace(10.h),
                          const Div(),
                          verticalSpace(10.h),
                          const Social_icon()
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
