import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/widgets/button_widget.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/screen/home/home_screen.dart';
import 'package:hack_talk/features/welcome/presentation/logic/onBoarding_cubit/on_boarding_cubit.dart';
import 'package:hack_talk/injections.dart' as dep_inj;

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingCubit>(
      create: (context) => dep_inj.inj(),
      child: Scaffold(
        body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GoToHomeState) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                AppRoutes.routeAndRemoveAllTo(context, const HomeScreen());
              });
            }
            final onBoarding = context.watch<OnBoardingCubit>();
            return Column(
              children: [
                Stack(children: [
                  SvgPicture.asset('up_image'.getSvgAsset),
                  if (onBoarding.currentPage !=
                      onBoarding.onBoardingList.length - 1) ...{
                    Positioned(
                      right: 16,
                      top: 60,
                      child: InkWell(
                        onTap: () {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            AppRoutes.routeAndRemoveAllTo(
                                context, const HomeScreen());
                          });
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                              AppStrings.skip,
                              fontSize: 16,
                              color: AppColors.textButtonBlueColor,
                              fontWeight: FontWeight.w500,
                            ),
                            Icon(Icons.arrow_forward,
                                color: AppColors.textButtonBlueColor),
                          ],
                        ),
                      ),
                    ),
                  },
                ]),
                Expanded(
                  child: PageView.builder(
                      controller: onBoarding.pageController,
                      onPageChanged: (page) {
                        context.read<OnBoardingCubit>().changePage(page);
                      },
                      itemCount: onBoarding.onBoardingList.length,
                      itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Expanded(
                                  child: SvgPicture.asset(
                                      onBoarding.onBoardingList[i].image),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Column(
                                    children: [
                                      TextWidget(
                                        onBoarding.onBoardingList[i].title,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: AppColors.bigTitleColor,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                              ],
                            ),
                          )),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      onBoarding.onBoardingList.length,
                      (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.bounceInOut,
                            width: index == onBoarding.currentPage ? 18 : 8,
                            height: 8,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: index == onBoarding.currentPage
                                  ? AppColors.textButtonBlueColor
                                  : AppColors.greyColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ButtonWidget(
                    onBoarding.currentPage ==
                            onBoarding.onBoardingList.length - 1
                        ? 'Get Start'
                        : 'Next',
                    onPressed: () {
                      context.read<OnBoardingCubit>().next();
                    },
                  ),
                ),
                SvgPicture.asset('down_image'.getSvgAsset),
              ],
            );
          },
        ),
      ),
    );
  }
}
