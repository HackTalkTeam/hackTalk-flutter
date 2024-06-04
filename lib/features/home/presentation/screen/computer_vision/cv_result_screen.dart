import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/features/home/presentation/logic/cv_result_cubit/cv_result_cubit.dart';
import 'package:video_player/video_player.dart';

class CVResultScreen extends StatelessWidget {
  const CVResultScreen({Key? key, required this.video}) : super(key: key);
  final File video;

  @override
  Widget build(BuildContext context) {
    VideoPlayerController? videoController;
    final result = context.watch<CvResultCubit>();
    return Scaffold(
        body: (Center(
            child: BlocProvider(
      create: (context) => CvResultCubit(),
      child: BlocConsumer<CvResultCubit, CvResultState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (video != null) ...{
              SizedBox(
                height: 300,
                width: 300,
                child: VideoPlayer(videoController!),
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  videoController!.play();
                },
                child: Text("play"),
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  videoController!.pause();
                },
                child: Text("stop"),
              )
            },
            ElevatedButton(
                onPressed: () {
                  result.showCVResult(video);
                },
                child: const Text("show result")),
            Expanded(
                child: ListView.builder(
              itemCount: result.cVResultModel.length,
              itemBuilder: (context, index) => Text(
                  "time: ${result.cVResultModel[index].time} >>>> result: ${result.cVResultModel[index].bodyLanguageClass}"),
            ))
          ]);
        },
      ),
    ))));
  }
}
