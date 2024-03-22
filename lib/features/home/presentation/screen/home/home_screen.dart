import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/auth/logic/log_out/log_out_cubit.dart';
import 'package:hack_talk/features/auth/screens/login/login_screen.dart';
import 'package:hack_talk/features/drawer/features/features_screen.dart';
import 'package:hack_talk/features/drawer/setting/setting/setting_screen.dart';
import 'package:hack_talk/features/home/presentation/screen/Audio/audio_screen.dart';
import 'package:hack_talk/features/home/presentation/screen/computer_vision/computer_vision_screen.dart';
import 'package:hack_talk/features/home/presentation/screen/vr/ve_screen.dart';
import 'package:hack_talk/features/home/presentation/widgets/home_button_widget.dart';

import 'alertWidget.dart';
import 'drawer_widget.dart';

final GlobalKey<ScaffoldState> globalKey = GlobalKey();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              globalKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu)),
        title: SvgPicture.asset('hacktalk'.getSvgAsset),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.drawerColor,
        width: MediaQuery.of(context).size.width * 0.6,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: SvgPicture.asset('hacktalk'.getSvgAsset),
              ),
              DrawerWidget(
                text: 'Features',
                icon: Icons.star_border,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const FeaturesScreen(),
                  );
                },
              ),
              DrawerWidget(
                text: 'Setting',
                icon: Icons.settings,
                onPressed: () {
                  AppRoutes.routeTo(context, SettingScreen());
                },
              ),
              BlocProvider(
                create: (context) => LogOutCubit(),
                child: BlocConsumer<LogOutCubit, LogOutState>(
                  listener: (context, state) {
                    if (state is LogOutSuccessState) {
                      AppRoutes.routeAndRemoveAllTo(context, LoginScreen());
                    } else if (state is LogOutFailedState) {
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
                    return DrawerWidget(
                      text: 'Logout ',
                      icon: Icons.logout,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialogWidget(),
                        ).then((value) {
                          if (value == true) {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              BlocProvider.of<LogOutCubit>(context,
                                      listen: false)
                                  .logOut();
                            });
                          }
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('home'.getSvgAsset),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Row(
                children: [
                  SvgPicture.asset('ellipse'.getSvgAsset),
                  const SizedBox(width: 8),
                  const TextWidget('Choose the option that suits you best'),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: HomeButtonWidget(
                    color: AppColors.homeButtonColor,
                    text: 'Computer Vision',
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        AppRoutes.routeTo(
                            context, const ComputerVisionScreen());
                      });
                    },
                    textColor: AppColors.mainBlueColor,
                    image: '',
                  ),
                ),
                // const SizedBox(
                //   width: 12,
                // ),
                // SmallHomeButtonWidget('question', onPressed: () {
                //   showDialog(
                //     context: context,
                //     builder: (context) => const AlertDialogWidget(
                //       text:
                //           'Computer version role is to take your movement while presenting, analyze it and return your movement mistakes so that you can work on them and improve your  performance skills ',
                //     ),
                //   );
                // }),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: HomeButtonWidget(
                    color: AppColors.homeButtonColor,
                    text: 'Speech',
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        AppRoutes.routeTo(context, const AudioScreen());
                      });
                    },
                    textColor: AppColors.mainBlueColor,
                    image: '',
                  ),
                ),
                // const SizedBox(
                //   width: 12,
                // ),
                // SmallHomeButtonWidget('question', onPressed: () {
                //   showDialog(
                //     context: context,
                //     builder: (context) => const AlertDialogWidget(
                //         text:
                //             'speech role is to take your voice ,analyse it and give you notice about your performance so you can work on your mistakes to get your perfect result '),
                //   );
                // }),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: HomeButtonWidget(
                    color: AppColors.homeButtonColor,
                    text: 'Virtual reality',
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        AppRoutes.routeTo(context, const VrScreen());
                      });
                    },
                    textColor: AppColors.mainBlueColor,
                    image: '',
                  ),
                ),
                // const SizedBox(
                //   width: 12,
                // ),
                // SmallHomeButtonWidget('question', onPressed: () {
                //   showDialog(
                //     context: context,
                //     builder: (context) => const AlertDialogWidget(
                //         text:
                //             'virtual reality role is to overcome your fear of public speaking  by placing you in an almost real environment so you can practice and get notices about your performance so you can work to improve it  '),
                //   );
                // }),
              ],
            ),

            const SizedBox(
              height: 44,
            ),
            // ButtonWidget(
            //   'Try',
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
