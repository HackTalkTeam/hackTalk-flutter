import 'dart:math';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/logic/computer_vision_cubit/computer_vision_cubit.dart';
import 'package:hack_talk/features/home/presentation/widgets/home_button_widget.dart';

import 'cv_result_screen.dart';

class ComputerVisionScreen extends StatefulWidget {
  const ComputerVisionScreen({Key? key}) : super(key: key);

  @override
  State<ComputerVisionScreen> createState() => _ComputerVisionScreenState();
}

class _ComputerVisionScreenState extends State<ComputerVisionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComputerVisionCubit>(
      create: (context) => ComputerVisionCubit(),
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
              title: const TextWidget("Computer vision",
                color: Colors.black, fontSize: 16,
                fontWeight: FontWeight.w600 ,),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
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
                            tabBarProperties: const TabBarProperties(
                                indicatorColor: AppColors.mainBlueColor
                            ),
                            tabs: const [
                              SizedBox(width: 150),
                              SizedBox(width: 150),
                            ],
                            views: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset('record video'.getSvgAsset),
                                    const SizedBox(height: 27),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: HomeButtonWidget(
                                            color: AppColors.mainBlueColor,
                                            text: 'Start recording ',
                                            onPressed: () async {
                                              await returnVideo.selectVideoFromCamera().then((value) {
                                                if(value!= null){
                                                  AppRoutes.routeTo(context, CVResultScreen( video: value,));
                                                }
                                              } );
                                            },
                                            textColor: AppColors.homeButtonColor,
                                            image: 'Upload video',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        'upload video image'.getSvgAsset),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: HomeButtonWidget(
                                            color: AppColors.mainBlueColor,
                                            text: 'Upload video',
                                            onPressed: () async {
                                              await returnVideo.selectVideoPauseFrom().then((value) {
                                                if(value!= null){
                                                  AppRoutes.routeTo(context, CVResultScreen( video: value,));
                                                }
                                              } );
                                            },
                                            textColor: AppColors.homeButtonColor,
                                            image: 'Upload video',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
            ),
          );
        },
      ),
    );
  }
}