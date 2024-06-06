import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/logic/audio_result_cubit/audio_result_cubit.dart';

class AudioAnalysisScreen extends StatelessWidget {
  const AudioAnalysisScreen({Key? key, required this.audio}) : super(key: key);
  final File audio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: BlocProvider(
        create: (context) => AudioResultCubit(),
        child: BlocConsumer<AudioResultCubit, AudioResultState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final audioResult = context.watch<AudioResultCubit>();
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      audioResult.showAudioResult(audio);
                    },
                    child: const Text("show result")),
                Row(
                  children: [
                    const TextWidget(
                      "Number of words:",
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(width: 88),
                    TextWidget("${audioResult.audioResultModel?.textLength}"),
                  ],
                ),
                Row(
                  children: [
                    const TextWidget("Number of sentences",
                        fontWeight: FontWeight.w600),
                    const SizedBox(width: 88),
                    TextWidget("${audioResult.audioResultModel?.numSentences}"),
                  ],
                ),
                const Row(
                  children: [
                    TextWidget("Most repeated three words:",
                        fontWeight: FontWeight.w600),
                  ],
                ),
                Column(
                  children: List.generate(
                      audioResult
                              .audioResultModel?.mostCommonWordsAll?.length ??
                          0, (i) {
                    return Rowwww(
                      name:
                          '${audioResult.audioResultModel?.mostCommonWordsAll?[i][0]}',
                      times:
                          '${audioResult.audioResultModel?.mostCommonWordsAll?[i][1]}',
                    );
                  }),
                ),
                  // Rowwww(
                  //   name: '${audioResult.audioResultModel!.mostCommonWordsAll![0][0]}',
                  //   times: '${audioResult.audioResultModel!.mostCommonWordsAll![0][1]}',
                  // ),
                  // Rowwww(
                  //   name: '${audioResult.audioResultModel!.mostCommonWordsAll![1][0]}',
                  //   times: '${audioResult.audioResultModel!.mostCommonWordsAll![1][1]}',
                  // ),
                  // Rowwww(
                  //   name: '${audioResult.audioResultModel!.mostCommonWordsAll![2][0]}',
                  //   times: '${audioResult.audioResultModel!.mostCommonWordsAll![2][1]}',
                  // ),
                const Row(
                  children: [
                    TextWidget("Longest sentence:",
                        fontWeight: FontWeight.w600),
                  ],
                ),
                Column(
                  children: [
                    TextWidget(
                      "${audioResult.audioResultModel?.longestSentence}",
                      maxLines: 20,
                      fontSize: 14,
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget("Repeated words", fontWeight: FontWeight.w600),
                    TextWidget(
                      "See aLL",
                      color: AppColors.mainBlueColor,
                    ),
                  ],
                ),
                Column(
                  children: List.generate(
                      audioResult.audioResultModel?.mostCommonWordsNoStop
                              ?.length ??
                          0, (i) {
                    return Rowwww(
                      name:
                          '${audioResult.audioResultModel?.mostCommonWordsNoStop?[i][0]}',
                      times:
                          '${audioResult.audioResultModel?.mostCommonWordsNoStop?[i][1]}',
                    );
                  }),
                ),
                // Column(
                //   children: [
                //     Rowwww(
                //       name: '${audioResult.audioResultModel?.mostCommonWordsNoStop?[0][0]}',
                //       times: '${audioResult.audioResultModel?.mostCommonWordsNoStop?[0][1]}',
                //     ),
                //     Rowwww(
                //       name: '${audioResult.audioResultModel?.mostCommonWordsNoStop?[1][0]}',
                //       times: '${audioResult.audioResultModel?.mostCommonWordsNoStop?[1][1]}',
                //     ),
                //     Rowwww(
                //       name: '${audioResult.audioResultModel?.mostCommonWordsNoStop?[2][0]}',
                //       times: '${audioResult.audioResultModel?.mostCommonWordsNoStop?[2][1]}',
                //     ),
                //   ],
                // ),
                const Row(
                  children: [
                    TextWidget("Fillers:", fontWeight: FontWeight.w600),
                  ],
                ),
                // Column(
                //   children: [
                //     Rowwww(
                //       name: '${audioResult.audioResultModel!.fillers![0]}',
                //       times: '',
                //     ),
                //     Rowwww(
                //       name: '${audioResult.audioResultModel!.fillers![1]}',
                //       times: '',
                //     ),
                //     Rowwww(
                //       name: '${audioResult.audioResultModel!.fillers![2]}',
                //       times: '',
                //     ),
                //   ],
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Rowwww extends StatelessWidget {
  const Rowwww({Key? key, required this.name, required this.times})
      : super(key: key);
  final String name;
  final String times;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 6),
      child: Row(
        children: [
          SvgPicture.asset('ellipse'.getSvgAsset),
          const SizedBox(width: 8),
          Row(
            children: [
              TextWidget('$name |   '),
              TextWidget(
                times,
                color: AppColors.mainBlueColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
