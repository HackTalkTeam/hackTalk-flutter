import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/features/home/presentation/logic/computer_vision_cubit/computer_vision_cubit.dart';
import 'package:hack_talk/features/home/presentation/widgets/home_container_widget.dart';
import 'package:hack_talk/injections.dart' as dep_inj;

class ComputerVisionScreen extends StatefulWidget {
  const ComputerVisionScreen({Key? key}) : super(key: key);

  @override
  State<ComputerVisionScreen> createState() => _ComputerVisionScreenState();
}

class _ComputerVisionScreenState extends State<ComputerVisionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComputerVisionCubit>(
      create: (context) => dep_inj.inj(),
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
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 22),
                    HomeContainerWidget(
                      text:
                          'you want try to present in live mode? please click here to start recording  ',
                      image: 'video',
                      onTap: () async {
                        await returnVideo.selectVideoFromCamera();
                      },
                    ),
                    const SizedBox(height: 12),
                    HomeContainerWidget(
                      text:
                          'you want try to present in live mode? please click here to start recording  ',
                      image: 'video_gallery',
                      onTap: () async {
                        await returnVideo.selectVideoPauseFrom();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
