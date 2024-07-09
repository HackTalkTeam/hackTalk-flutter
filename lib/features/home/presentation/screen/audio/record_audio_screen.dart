import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/logic/audio_cubit/audio_cubit.dart';
import 'package:hack_talk/features/home/presentation/screen/audio/time_over_screen.dart';

//import 'package:record_mp3/record_mp3.dart';

import 'audio_result/audio_result_screen.dart';
import 'audio_widget.dart';

class RecordAudioScreen extends StatefulWidget {
  const RecordAudioScreen({super.key});

  @override
  _RecordAudioScreenState createState() => _RecordAudioScreenState();
}

bool isRecording = true;

class _RecordAudioScreenState extends State<RecordAudioScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AudioCubit>(
      create: (context) => AudioCubit(),
      child: BlocConsumer<AudioCubit, AudioState>(
        listener: (context, state) {},
        builder: (context, state) {
          final returnAudio = context.read<AudioCubit>();

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
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              centerTitle: true,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextWidget(
                        'speak fluently and confidently',
                        fontSize: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 33.0, right: 33.0, top: 10.0, bottom: 30.0),
                        child: TextWidget(
                          "Ensure that your presentation does not exceed 3 minutes and is not less than a minute for the best results.",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      (state is DurationRecordInitial)
                          ? Text(
                              '${state.hours.toString().padLeft(2, '0')}:${state.minutes.toString().padLeft(2, '0')}:${state.second.toString().padLeft(2, '0')}',
                              style: const TextStyle(fontSize: 32),
                            )
                          : const TextWidget(
                              '00:00:00',
                              fontSize: 32,
                            ),
                      SvgPicture.asset('record'.getSvgAsset),
                      const SizedBox(height: 20),
                      if (returnAudio.isRecording)
                        const SizedBox(
                            height: 100, child: SoundWaveformWidget()),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/second.png"),
                          const SizedBox(width: 15),
                          InkWell(
                              onTap: () async {
                                returnAudio.startRecord();
                              },
                              child: SvgPicture.asset(
                                  'start audio record'.getSvgAsset)),
                          if (returnAudio.isRecording)
                            InkWell(
                                onTap: () {
                                  returnAudio.stopRecord();
                                },
                                child: SvgPicture.asset(
                                    'stop icon audio record'.getSvgAsset)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              returnAudio.statusText,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 20),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                returnAudio.play();
                              },
                              child: returnAudio.isComplete &&
                                      returnAudio.recordFilePath != null
                                  ? Image.asset("assets/images/play.png")
                                  : Container(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 17),
                      TextButton(
                        onPressed: () {
                          WidgetsBinding.instance
                        .addPostFrameCallback((timeStamp) {
                      AppRoutes.routeTo(
                          context, const TimeOverScreen());
                    });
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: AppColors.mainBlueColor,
                            ),
                          ),
                        ),
                        child: const Text(
                          '                                    Done                                   ',
                          style: TextStyle(color: AppColors.mainBlueColor),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}