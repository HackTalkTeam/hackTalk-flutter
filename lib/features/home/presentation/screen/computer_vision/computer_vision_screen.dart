import 'dart:math';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/logic/computer_vision_cubit/computer_vision_cubit.dart';
import 'package:hack_talk/features/home/presentation/widgets/home_button_widget.dart';
import 'package:hack_talk/injections.dart' as dep_inj;

class ComputerVisionScreen extends StatefulWidget {
  const ComputerVisionScreen({Key? key}) : super(key: key);

  @override
  State<ComputerVisionScreen> createState() => _ComputerVisionScreenState();
}

class _ComputerVisionScreenState extends State<ComputerVisionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComputerVisionCubit>(
      create: (context) => dep_inj.inj(),
      child: BlocConsumer<ComputerVisionCubit, ComputerVisionState>(
        listener: (context, state) {},
        builder: (context, state) {
          final returnVideo = context.watch<ComputerVisionCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    AppRoutes.pop(context);
                  });
                },
                icon: const Icon(Icons.arrow_back),
              ),
              title: const TextWidget("Computer version",
                  color: Colors.black, fontSize: 16),
            ),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 22),
                      const TextWidget(
                        "Welcome to the world of confident communication! Your journey starts now. Would you like to seize the moment and record your presentation live, or do you have a pre-recorded presentation ready to analyse",
                        maxLines: 4,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBodyColor,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 600,
                        child: ContainedTabBarView(
                          tabs: const [
                            SizedBox(),
                            SizedBox(),
                          ],
                          views: [
                            Column(
                              children: [
                                SvgPicture.asset('record video'.getSvgAsset),
                                const SizedBox(height: 27),
                                HomeButtonWidget(
                                  color: AppColors.mainBlueColor,
                                  text: 'Start recording ',
                                  onPressed: () async {
                                    await returnVideo.selectVideoFromCamera();
                                  },
                                  textColor: AppColors.homeButtonColor,
                                  image: 'Upload video',
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                    'upload video image'.getSvgAsset),
                                HomeButtonWidget(
                                  color: AppColors.mainBlueColor,
                                  text: 'Upload video',
                                  onPressed: () async {
                                    await returnVideo.selectVideoPauseFrom();
                                  },
                                  textColor: AppColors.homeButtonColor,
                                  image: 'Upload video',
                                ),
                              ],
                            ),
                          ],
                          onChange: (index) => log(index),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
