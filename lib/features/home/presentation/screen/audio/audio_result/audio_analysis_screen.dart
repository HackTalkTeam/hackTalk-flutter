import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/drawer/rating/presentation/screens/rating/rating_screen.dart';
import 'package:hack_talk/features/home/presentation/logic/audio_result_cubit/audio_result_cubit.dart';
import 'package:hack_talk/features/home/presentation/screen/Audio/audio_screen.dart';
import 'package:hack_talk/features/home/presentation/screen/home/alertWidget.dart';

class AudioAnalysisScreen extends StatelessWidget {
  const AudioAnalysisScreen({Key? key, required this.audio}) : super(key: key);
  final File audio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: BlocProvider(
        create: (context) => AudioResultCubit()..showAudioResult(audio),
        child: BlocConsumer<AudioResultCubit, AudioResultState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            final audioResult = context.watch<AudioResultCubit>();
            return state is AudioResultLoadingInitial ?
            const AlertDialog2Widget():
              SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          "textLength:",
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(width: 88),
                        TextWidget(
                            "${audioResult.audioResultModel?.textLength}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget("Number of sentences",
                            fontWeight: FontWeight.w600),
                        const SizedBox(width: 88),
                        TextWidget(
                            "${audioResult.audioResultModel?.numSentences}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            TextWidget("Longest sentence:",
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        Column(
                          children: [
                            TextWidget(
                              '"${audioResult.audioResultModel?.longestSentence}"',
                              maxLines: 22,
                              fontSize: 13,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget("longest sentence word count",
                            fontWeight: FontWeight.w600),
                        const SizedBox(width: 88),
                        TextWidget(
                            "${audioResult.audioResultModel?.longestSentenceWordCount}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget("Repeated word sentences",
                            fontWeight: FontWeight.w600),
                        const SizedBox(width: 88),
                        TextWidget(
                            "${audioResult.audioResultModel?.repeatedWordSentences}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            TextWidget("Most common words :",
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        Column(
                          children: List.generate(
                              audioResult.audioResultModel?.mostCommonWordsAll
                                      ?.length ??
                                  0, (i) {
                            return Rowwww(
                              name:
                                  '${audioResult.audioResultModel?.mostCommonWordsAll?[i][0]}',
                              times:
                                  '${audioResult.audioResultModel?.mostCommonWordsAll?[i][1]}',
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            TextWidget("Most common words without stopwords:",
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        Column(
                          children: List.generate(
                              audioResult.audioResultModel
                                      ?.mostCommonWordsNoStop?.length ??
                                  0, (i) {
                            return Rowwww(
                              name:
                                  '${audioResult.audioResultModel?.mostCommonWordsNoStop?[i][0]}',
                              times:
                                  '${audioResult.audioResultModel?.mostCommonWordsNoStop?[i][1]}',
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            TextWidget("Fillers:", fontWeight: FontWeight.w600),
                          ],
                        ),
                        Column(
                          children: List.generate(
                              audioResult.audioResultModel
                                      ?.mostCommonWordsNoStop?.length ??
                                  0, (i) {
                            return Rowwww2(
                              name: audioResult.audioResultModel!.fillers![0],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget("loudness precentage",
                                fontWeight: FontWeight.w600),
                            TextWidget(
                              "${audioResult.audioResultModel?.loudnessPercentage}",
                              maxLines: 20,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget("WPM",
                                fontWeight: FontWeight.w600),
                            TextWidget(
                              "${audioResult.audioResultModel?.wpm}",
                              maxLines: 20,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget("Duration minutes",
                                fontWeight: FontWeight.w600),
                            TextWidget(
                              "${audioResult.audioResultModel?.durationMinutes}",
                              maxLines: 20,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.homeButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            TextWidget("Volume advice",
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        Column(
                          children: [
                            TextWidget(
                              '"${audioResult.audioResultModel?.volumeAdvice}"',
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          AppRoutes.routeTo(context, const RatingScreen());
                        },
                        child: Text(
                          '          Rate us          ',
                          style: TextStyle(color: AppColors.mainBlueColor),
                        ),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: AppColors.mainBlueColor,),
                          ),
                        ),
                      ),
                      Container(
                        height: 41,
                        decoration: BoxDecoration(
                          color: AppColors.mainBlueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            AppRoutes.routeAndRemoveTo(context, const AudioScreen());
                          },
                          child: Text(
                            '          Try again          ',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
              TextWidget('$name   '),
              TextWidget(
                "(${times} times)",
                color: AppColors.mainBlueColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Rowwww2 extends StatelessWidget {
  const Rowwww2({Key? key, required this.name})
      : super(key: key);
  final String name;

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
              TextWidget('$name')
            ],
          ),
        ],
      ),
    );
  }
}
