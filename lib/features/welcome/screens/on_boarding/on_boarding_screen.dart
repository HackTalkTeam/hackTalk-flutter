import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/button_second_widget.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/auth/screens/sign_up/sign_up_screen.dart';
import 'package:hack_talk/features/welcome/logic/on_boarding_cubit/on_boarding_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingCubit>(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GoToHomeState) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                AppRoutes.routeAndRemoveAllTo(context, const SignUpScreen());
              });
            }
            final onBoarding = context.watch<OnBoardingCubit>();
            return Scaffold(
              appBar: AppBar(
                forceMaterialTransparency: true,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('hacktalk'.getSvgAsset),
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                          controller: onBoarding.pageController,
                          onPageChanged: (page) {
                            context.read<OnBoardingCubit>().changePage(page);
                          },
                          itemCount: onBoarding.onBoardingList.length,
                          itemBuilder: (context, i) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SvgPicture.asset(
                                          onBoarding.onBoardingList[i].image),
                                    ),
                                    //const Spacer(),
                                    TextWidget(
                                      onBoarding.onBoardingList[i].title,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: AppColors.mainBlueColor,
                                    ),
                                    const SizedBox(height: 12),
                                    TextWidget(
                                      onBoarding.onBoardingList[i].body,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.textBodyColor,
                                      textAlign: TextAlign.center,
                                      maxLines: 5,
                                    ),
                                    //const Spacer(),
                                  ],
                                ),
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            onBoarding.onBoardingList.length,
                            (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.bounceInOut,
                                  width:
                                      index == onBoarding.currentPage ? 18 : 8,
                                  height: 8,
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: index == onBoarding.currentPage
                                        ? AppColors.mainBlueColor
                                        : AppColors.brownColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 15, top: 22),
                      child: ButtonWidget(
                        onBoarding.currentPage ==
                                onBoarding.onBoardingList.length - 1
                            ? 'Get Start'
                            : 'Next',
                        color: Colors.white,
                        onPressed: () {
                          context.read<OnBoardingCubit>().next();
                        },
                      ),
                    ),
                    onBoarding.currentPage ==
                            onBoarding.onBoardingList.length - 1
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 35),
                            child: SizedBox(
                              width: double.infinity,
                              height: 35.h,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 35),
                            child: ButtonSec(
                              text: 'Skip',
                              color: AppColors.mainBlueColor,
                              onPressed: () {
                                AppRoutes.routeAndRemoveAllTo(context, const SignUpScreen());
                              },
                            ),
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
