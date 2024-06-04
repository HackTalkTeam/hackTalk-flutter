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
  const AudioAnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(28.0),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  TextWidget(
                    "Number of words:",
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: 88),
                  TextWidget("66"),
                ],
              ),
              Row(
                children: [
                  TextWidget("Number of sentences",
                      fontWeight: FontWeight.w600),
                  SizedBox(width: 88),
                  TextWidget("66"),
                ],
              ),
              Row(
                children: [
                  TextWidget("Most repeated three words:",
                      fontWeight: FontWeight.w600),
                ],
              ),
              Column(
                children: [
                  Rowwww(
                    name: 'uh',
                    times: '15 time',
                  ),
                  Rowwww(
                    name: 'Uh',
                    times: '15 time',
                  ),
                  Rowwww(
                    name: 'Uh',
                    times: '15 time',
                  ),
                ],
              ),
              Row(
                children: [
                  TextWidget("Longest sentence:",
                      fontWeight: FontWeight.w600),
                ],
              ),
              Column(
                children: [
                  TextWidget(
                    "By leveraging innovative techniques, "
                    "um, we can ensure that every learner, uh,"
                    " receives the support they need to succeed.",
                    maxLines: 20,
                    fontSize: 14,
                  ),
                ],
              ),
              Row(
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
                children: [
                  Rowwww(
                    name: 'Uh',
                    times: '15 time',
                  ),
                  Rowwww(
                    name: 'Uh',
                    times: '15 time',
                  ),
                  Rowwww(
                    name: 'Uh',
                    times: '15 time',
                  ),
                  Rowwww(
                    name: 'Uh',
                    times: '15 time',
                  ),
                  Rowwww(
                    name: 'Uh',
                    times: '15 time',
                  ),
                ],
              ),
              Row(
                children: [
                  TextWidget("Fillers:", fontWeight: FontWeight.w600),
                ],
              ),
              Column(
                children: [
                  Rowwww(
                    name: 'Uh',
                    times: '',
                  ),
                  Rowwww(
                    name: 'Uh',
                    times: '',
                  ),
                  Rowwww(
                    name: 'Uh',
                    times: '',
                  ),
                ],
              ),
              Row(
                children: [],
              ),
            ],
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
