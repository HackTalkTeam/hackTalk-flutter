import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/features/drawer/setting/change_password/change_password_screen.dart';
import 'package:hack_talk/features/drawer/setting/contact_us/view/screen/contact_us_screen.dart';
import 'package:hack_talk/features/drawer/setting/personal_information/personal_information_screen.dart';

import '../../../../rating/presentation/screens/rating/rating_screen.dart';
import '../widgets/custom_container.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: AppColors.mainBlueColor,
        ),
        forceMaterialTransparency: true,
        title: Text(
          'Setting',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto Flex',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              CustomContainer(
                title: 'personal information ',
                iconOne: 'assets/svgs/fluent_person-24-regular.svg',
                iconTwo: 'assets/svgs/iconamoon_arrow-right-2-bold.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonInformationScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              CustomContainer(
                title: 'Change password  ',
                iconOne: 'assets/svgs/arcticons_nc-passwords.svg',
                iconTwo: 'assets/svgs/iconamoon_arrow-right-2-bold.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              const Divider(
                color: Color(0xffDFDCDC),
              ),
              SizedBox(height: 20.h),
              CustomContainer(
                title: 'Rate this app ',
                iconOne: 'assets/svgs/solar_star-fall-broken.svg',
                iconTwo: 'assets/svgs/iconamoon_arrow-right-2-bold.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RatingScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              CustomContainer(
                title: 'Contact us ',
                iconOne: 'assets/svgs/mdi_about-circle-outline.svg',
                iconTwo: 'assets/svgs/iconamoon_arrow-right-2-bold.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ContactUsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
