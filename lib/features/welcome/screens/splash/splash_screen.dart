import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/helpers/cache_helper.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/features/home/presentation/screen/home/home_screen.dart';
import 'package:hack_talk/features/welcome/screens/on_boarding/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.mainBlueColor, Colors.white],
        ),
      ),
      child: AnimatedSplashScreen(
        duration: 1500,
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(milliseconds: 1500),
        splash: Column(
          children: [
            SizedBox(
                height: 130,
                width: 212,
                child: SvgPicture.asset("assets/svgs/logo_svg.svg")),
            const SizedBox(height: 12),
            SvgPicture.asset("assets/svgs/text_logo.svg"),
            const SizedBox(height: 12),
            SvgPicture.asset("assets/svgs/text2_logo.svg"),
          ],
        ),
        nextScreen: CacheHelper.getData(key: AppStrings.token)
            ? const HomeScreen()
            : const OnBoardingScreen(),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
