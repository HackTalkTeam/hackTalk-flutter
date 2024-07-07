import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/drawer/setting/contact_us/logic/cubit/contact_us_cubit.dart';
import 'package:hack_talk/features/drawer/setting/contact_us/view/widgets/lable_for_tff.dart';

import '../../../../../../core/widgets/button_widget.dart';
import '../widgets/custom_tff_for_contact_us.dart';

class ContactUsScreen extends StatefulWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: AppColors.mainBlueColor,
        ),
        title: const Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto Flex',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ContactUsCubit(),
        child: BlocConsumer<ContactUsCubit, ContactUsState>(
          listener: (context, state) {
            if (state is ContactUsSuccessState) {
              showDialog(context: context,
                  builder: (BuildContext context) {
                return const AlertDialog(
                  backgroundColor: AppColors.mainBlueColor,
                  title: TextWidget('Success',color: Colors.white,),
                  content: TextWidget('Your message has been sent',color: Colors.white,),
                );
                  }
              );
            }           },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 17,),
                        const Text('Get in Touch with US',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.mainBlueColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Text(
                          'Fill the form and our team will get \n back to you with in 24 hours',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff737373),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SvgPicture.asset('assets/svgs/contact_us.svg'),
                        SizedBox(height: 5.h),
                        const LableForTff(title: 'Full Name'),
                        CustomTffForContactUs(
                          controller: nameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "name must not be empty";
                            }
                            return null;
                          },),
                        SizedBox(height: 5.h),
                        const LableForTff(title: 'Email'),
                        CustomTffForContactUs(
                          controller: emailController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "email must not be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 5.h),
                        const LableForTff(title: 'Message'),
                        CustomTffForContactUs(
                          controller: messageController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "email must not be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h),
                        ButtonWidget(
                          AppStrings.submit,
                          color: Colors.white,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<ContactUsCubit>(context).sendMessage(
                                  email: emailController.text,
                                  full_name: nameController.text,
                                  message: messageController.text
                              );
                            }
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
      ),
    );
  }
}
