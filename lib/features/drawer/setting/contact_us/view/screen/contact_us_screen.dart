import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/features/drawer/setting/contact_us/view/widgets/lable_for_tff.dart';

import '../../../../../../core/widgets/button_widget.dart';
import '../widgets/custom_tff_for_contact_us.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Column(
              children: [
                const Text('Get in Touch with US',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.mainBlueColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                Text(
                  'Fill the form and our team will get \n back to you with in 24 hours',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff737373),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SvgPicture.asset('assets/svgs/contact_us.svg'),
                SizedBox(height: 5.h),
                const LableForTff(title: 'Full Name'),
                CustomTffForContactUs(
                  controller: nameController,
                ),
                SizedBox(height: 5.h),
                const LableForTff(title: 'Email'),
                CustomTffForContactUs(
                  controller: emailController,
                ),
                SizedBox(height: 5.h),
                const LableForTff(title: 'Message'),
                CustomTffForContactUs(
                  controller: messageController,
                ),
                SizedBox(height: 15.h),
                ButtonWidget(
                  AppStrings.submit,
                  color: Colors.white,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
