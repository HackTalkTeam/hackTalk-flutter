// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hack_talk/core/helpers/spacing.dart';
// import 'package:hack_talk/core/utils/app_strings.dart';
// import 'package:hack_talk/core/utils/textstyle.dart';
// import 'package:hack_talk/core/widgets/custom_text_form_feild.dart';
//
// import 'logic/cubit/contact_us_cubit.dart';
//
// class ContactUsScreen extends StatelessWidget {
//   const ContactUsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ContactUsCubit(),
//       child: BlocConsumer<ContactUsCubit, ContactUsState>(
//         listener: (context, state) {
//           if (state is ContactUsSuccessState) {
//             showDialog(
//               context: context,
//               builder: (context) => const AlertDialog(
//                 content: Text("done",
//                     style: TextStyle(
//                       color: Colors.white,
//                     )),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           } else if (state is ContactUsFailedState) {
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 content: Text(state.msg,
//                     style: const TextStyle(
//                       color: Colors.white,
//                     )),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           } else {
//             const CircularProgressIndicator();
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//               body: SafeArea(
//                 child: Padding(
//                   padding:
//                   EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.0.h),
//                   child: SingleChildScrollView(
//                     child: Form(
//                       key: formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Center(child: Image.asset('assets/images/Group 237.png')),
//                           verticalSpace(16.h),
//                           Text(
//                             AppStrings.welcomBack,
//                             style: TextStyles.font24mainBlueColor,
//                           ),
//                           Text(AppStrings.please, style: TextStyles.font11black),
//                           verticalSpace(16.h),
//                           CustomTextFormFeild(
//                             lableText: ' email ',
//                             hintText: AppStrings.email,
//                             kbType: TextInputType.emailAddress,
//                             controller: emailController,
//                             onChanged: (value) {},
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "email must not be empty";
//                               }
//                               return null;
//                             },
//                           ),
//                           verticalSpace(16.h),
//                           CustomTextFormFeild(
//                             isObscureText: isObsecuretext,
//                             suffixIcon: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   isObsecuretext = !isObsecuretext;
//                                 });
//                               },
//                               child: Icon(
//                                 isObsecuretext
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             lableText: 'password',
//                             hintText: AppStrings.password,
//                             kbType: TextInputType.visiblePassword,
//                             onChanged: (value) {},
//                             controller: passwordController,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "password must not be empty";
//                               }
//                               return null;
//                             },
//                           ),
//                           Row(
//                             children: [
//                               FlutterSwitch(
//                                 height: 20.0,
//                                 width: 40.0,
//                                 padding: 4.0,
//                                 toggleSize: 15.0,
//                                 borderRadius: 10.0,
//                                 activeColor: AppColors.mainBlueColor,
//                                 value: isSwitched,
//                                 onToggle: (value) {
//                                   setState(() {
//                                     isSwitched = value;
//                                   });
//                                 },
//                               ),
//                               Text(AppStrings.rememberMe,
//                                   style: TextStyles.font11black),
//                               const Spacer(),
//                               GestureDetector(
//                                 onTap: () {
//                                   AppRoutes.routeTo(
//                                       context, ForgotPassword());
//                                 },
//                                 child: Text(
//                                   AppStrings.forgotPassword,
//                                   style: TextStyles.font11black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           verticalSpace(10.h),
//                           ButtonWidget(
//                             AppStrings.login,
//                             color: Colors.white,
//                             onPressed: () {
//                               if (formKey.currentState!.validate()) {
//                                 BlocProvider.of<LoginCubit>(context).login(
//                                   email: emailController.text,
//                                   password: passwordController.text,
//                                 );
//                               }
//                             },
//                           ),
//                           verticalSpace(10.h),
//                           Center(
//                               child: NewToHachTalk(
//                                 textOne: AppStrings.donothaveanAccount,
//                                 onTap: () {
//                                   AppRoutes.routeTo(context, const SignUpScreen());
//                                 },
//                                 textTwo: AppStrings.signUp,
//                               )),
//                           verticalSpace(10.h),
//                           const Div(),
//                           verticalSpace(10.h),
//                           const Social_icon()
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ));
//         },
//       ),
//     );
//   }
// }
