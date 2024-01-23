import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/features/home/presentation/logic/audio_cubit/audio_cubit.dart';
import 'package:hack_talk/features/home/presentation/screen/Audio/record_audio_screen.dart';
import 'package:hack_talk/features/home/presentation/widgets/home_container_widget.dart';
import 'package:hack_talk/injections.dart' as dep_inj;

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AudioCubit>(
      create: (context) => dep_inj.inj(),
      child: BlocConsumer<AudioCubit, AudioState>(
        listener: (context, state) {},
        builder: (context, state) {
          final returnAudio = context.watch<AudioCubit>();
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
                      image: 'audio',
                      onTap: () {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          AppRoutes.routeTo(context, const RecordAudioScreen());
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    HomeContainerWidget(
                      text:
                          'you want try to present in live mode? please click here to start recording  ',
                      image: 'audio_gallery',
                      onTap: () async {
                        await returnAudio.selectFiles();
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
