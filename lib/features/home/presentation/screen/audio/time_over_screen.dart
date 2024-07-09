import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/logic/audio_cubit/audio_cubit.dart';
import 'package:hack_talk/features/home/presentation/widgets/home_button_widget.dart';

import 'audio_result/audio_result_screen.dart';

class TimeOverScreen extends StatelessWidget {
  const TimeOverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: const TextWidget('Record voice',
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                "Time is over",
                fontSize: 33,
                fontWeight: FontWeight.w600,
                color: Colors.grey[400],
              ),
              SizedBox(height: 12),
              TextWidget(
                  "your recorded presentation has been saved successfully",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400]),
              const SizedBox(height: 22),
              Image.asset("assets/images/timeover.png"),
              const SizedBox(height: 44),
              Row(
                children: [
                  Expanded(
                    child: BlocProvider(
                      create: (context) => AudioCubit(),
                      child: BlocConsumer<AudioCubit, AudioState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          final returnAudio = context.read<AudioCubit>();
                          return HomeButtonWidget(
                            color: AppColors.mainBlueColor,
                            text: 'Show your result',
                            onPressed: () {
                              returnAudio.getFilePath().then(
                                    (value) {
                                  if (value != null) {
                                    AppRoutes.routeTo(
                                        context,
                                          AudioResultScreen(audio: File(value)));
                                  }
                                },
                              );
                            },
                            textColor: AppColors.homeButtonColor,
                            image: ' ',
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
