import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/drawer/rating/presentation/screens/rating/rating_screen.dart';
import 'package:hack_talk/features/home/presentation/logic/cv_result_cubit/cv_result_cubit.dart';
import 'package:video_player/video_player.dart';

import '../home/alertWidget.dart';
import 'computer_vision_screen.dart';

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
            actions: const [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: TextWidget("Done",color: AppColors.mainBlueColor,),
              ),
            ],
          ),
          body: (Center(
              child: BlocProvider(
                create: (context) => CvResultCubit()..showCVResult(widget.video),
                child: BlocConsumer<CvResultCubit, CvResultState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    final result = context.watch<CvResultCubit>();
                    return state is CvResultLoadingState?
                    AlertDialog2Widget():
                      Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: SingleChildScrollView(
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
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 41,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(90),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            videoController!.play();
                                          },
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text(
                                            'play',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 41,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(90),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          videoController!.pause();
                                        },
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          'stop',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              },
                              // TextButton(
                              //   onPressed: () {
                              //     result.showCVResult(widget.video);
                              //   },
                              //   style: TextButton.styleFrom(
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(10),
                              //       side: const BorderSide(color: AppColors.mainBlueColor,),
                              //     ),
                              //   ),
                              //   child: const Text(
                              //     '      show result      ',
                              //     style: TextStyle(color: AppColors.mainBlueColor),
                              //   ),
                              // ),
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
                                      strokeWidth: 8,
                                    ),
                                  ),
                                  Text(
                                    "${result?.score?.floor() ?? 0}",
                                    style: const TextStyle(
                                        fontSize: 33,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.mainBlueColor),
                                  ),
                                ],
                              ): const CircularProgressIndicator(color: AppColors.mainBlueColor),
                              const SizedBox(height: 12),
                              const TextWidget("Wonderful! It's not a bad ratio.",fontWeight: FontWeight.w600,fontSize: 12,),
                              const TextWidget(
                                "It's possible to try again to increase the ratio even more and achieve more efficient performance.",
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
                              // const SizedBox(height: 12),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(vertical: 4.0),
                              //   child: Container(
                              //     height: 45,
                              //     decoration: BoxDecoration(
                              //       color: AppColors.mainBlueColor,
                              //       borderRadius: BorderRadius.circular(10),
                              //     ),
                              //     child: const Row(
                              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //       children: [
                              //         Text('second'),
                              //         Text('performance'),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // result != null ?
                              // Expanded(
                              //     child: ListView.builder(
                              //         itemCount: result.cVResultModel.length,
                              //         itemBuilder: (context, index) {
                              //           return PerformanceRow(
                              //               second: result.cVResultModel[index].time,
                              //               performance:
                              //               '${result.cVResultModel[index].bodyLanguageClass}');
                              //         }
                              //     )): CircularProgressIndicator(color: AppColors.mainBlueColor,),

                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: DataTable(
                                    columns: const [
                                      DataColumn(label: Text('Second')),
                                      DataColumn(label: Text('Performance')),
                                    ],
                                    rows: List<DataRow>.generate( result.cVResultModel.length,
                                          (index) => DataRow(
                                        color: MaterialStateProperty.resolveWith<Color?>(
                                              (Set<MaterialState> states) {
                                            // Alternate colors for rows
                                            return index.isEven ? Colors.white: Colors.grey[200];
                                          },
                                        ),
                                        cells: [
                                          DataCell(Text( result.cVResultModel[index].time.floor().toString())),
                                          DataCell(Text("${result.cVResultModel[index].bodyLanguageClass}")),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      AppRoutes.routeTo(context, const RatingScreen());
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: AppColors.mainBlueColor,),
                                      ),
                                    ),
                                    child: const Text(
                                      '          Rate us          ',
                                      style: TextStyle(color: AppColors.mainBlueColor),
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
                                        AppRoutes.routeAndRemoveTo(context, const ComputerVisionScreen());
                                      },
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Text(
                                        '          Try again          ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
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

  const PerformanceRow({super.key, required this.second, required this.performance});

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