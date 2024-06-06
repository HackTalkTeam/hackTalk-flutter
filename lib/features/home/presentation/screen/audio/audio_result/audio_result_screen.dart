import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/logic/audio_result_cubit/audio_result_cubit.dart';

import 'audio_analysis_screen.dart';

class AudioResultScreen extends StatelessWidget {
  const AudioResultScreen({super.key, required this.audio});
  final File audio;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Result'),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Done"),
            ),
          ],
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.homeButtonColor,
                ),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColors.mainBlueColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Text",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Analysis",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocProvider(
                create: (context) => AudioResultCubit(),
                child: BlocConsumer<AudioResultCubit, AudioResultState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    final audioResult = context.watch<AudioResultCubit>();
                    return Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              audioResult.showAudioResult(audio);
                            },
                            child: const Text("show result")),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextWidget("${audioResult.audioResultModel?.generatedText??''}",
                            maxLines: 20,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBodyColor,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Center(child: AudioAnalysisScreen(audio: audio,)),
          ],
        ),
      ),
    );
  }
}