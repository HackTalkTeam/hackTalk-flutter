import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/logic/cv_result_cubit/cv_result_cubit.dart';
import 'package:video_player/video_player.dart';

class CVResultScreen extends StatefulWidget {
  const CVResultScreen({Key? key, required this.video}) : super(key: key);
  final File video;

  @override
  State<CVResultScreen> createState() => _CVResultScreenState();
}

class _CVResultScreenState extends State<CVResultScreen> {
  @override
  Widget build(BuildContext context) {
    VideoPlayerController? videoController;
    videoController = VideoPlayerController.file(widget.video);
    videoController!.initialize().then((_) {
      videoController!.play();
    });
    return SafeArea(
      child: Scaffold(
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
            title: const TextWidget('Result',
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
            centerTitle: true,
          ),
          body: (Center(
              child: BlocProvider(
                create: (context) => CvResultCubit(),
                child: BlocConsumer<CvResultCubit, CvResultState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    final result = context.watch<CvResultCubit>();
                    return Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (widget.video != null) ...{
                              SizedBox(
                                height: 200,
                                width: 350,
                                child: VideoPlayer(videoController!),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  MaterialButton(
                                    color: Colors.red,
                                    onPressed: () {
                                      videoController!.play();
                                    },
                                    child: Text("play"),
                                  ),
                                  MaterialButton(
                                    color: AppColors.mainBlueColor,
                                    onPressed: () {
                                      videoController!.pause();
                                    },
                                    child: Text("stop"),
                                  )
                                ],
                              ),
                            },
                            MaterialButton(
                              color: AppColors.mainBlueColor,
                              onPressed: () {
                                result.showCVResult(widget.video);
                              },
                              child: const Text("show result"),
                            ),
                            const SizedBox(height: 12),
                            result != null ?
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.homeButtonColor,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  height: 100,
                                  width: 100,
                                  child: CircularProgressIndicator(
                                    value: result?.score ?? 0 / 100,
                                    backgroundColor: AppColors.homeButtonColor,
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                        AppColors.mainBlueColor),
                                    strokeWidth: 10,
                                  ),
                                ),
                                Text(
                                  "${result?.score ?? 0}",
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainBlueColor),
                                ),
                              ],
                            ): CircularProgressIndicator(color: AppColors.mainBlueColor),
                            const SizedBox(height: 12),
                            const TextWidget(
                              "Wonderful! It's not a bad ratio. It's possible to try again to increase the ratio even more and achieve more efficient performance.",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextWidget(
                                  'Performance Analysis:',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: AppColors.mainBlueColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('second'),
                                    Text('performance'),
                                  ],
                                ),
                              ),
                            ),
                            result != null ?
                            Expanded(
                                child: ListView.builder(
                                    itemCount: result.cVResultModel.length,
                                    itemBuilder: (context, index) {
                                      return PerformanceRow(
                                          second: result.cVResultModel[index].time,
                                          performance:
                                          '${result.cVResultModel[index].bodyLanguageClass}');
                                    }
                                )): CircularProgressIndicator(color: AppColors.mainBlueColor,),
                          ]),
                    );
                  },
                ),
              )))),
    );
  }
}

class PerformanceRow extends StatelessWidget {
  final dynamic second;
  final String performance;

  PerformanceRow({required this.second, required this.performance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.homeButtonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('$second'),
            Text(performance),
          ],
        ),
      ),
    );
  }
}
