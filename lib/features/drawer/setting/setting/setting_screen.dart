import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/features/drawer/setting/change_password/change_password_screen.dart';
import 'package:hack_talk/features/drawer/setting/contact_us/contact_us_screen.dart';
import 'package:hack_talk/features/drawer/setting/personal_information/personal_information_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                AppRoutes.routeTo(context, PersonInformationScreen());
              },
                child: Text('PersonInformation')),
            InkWell(
                onTap: (){
                  AppRoutes.routeTo(context, ChangePasswordScreen());
                },
                child: Text('ChangePasswordScreen')),
            InkWell(
                onTap: (){
                  AppRoutes.routeTo(context, ContactUsScreen());
                },
                child: Text('Contact Us')),
          ],
        ),
      ),
    );
  }
}
