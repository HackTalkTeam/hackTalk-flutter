import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/features/home/presentation/logic/audio_cubit/audio_cubit.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:hack_talk/injections.dart' as dep_inj;

class RecordAudioScreen extends StatefulWidget {
  const RecordAudioScreen({super.key});

  @override
  _RecordAudioScreenState createState() => _RecordAudioScreenState();
}

class _RecordAudioScreenState extends State<RecordAudioScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AudioCubit>(
      create: (context) => dep_inj.inj(),
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
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetectorWidget(
                          text: 'start',
                          color: Colors.red,
                          textColor: Colors.white,
                          onTap: () async {
                            returnAudio.startRecord();
                          },
                        ),
                        GestureDetectorWidget(
                          text: RecordMp3.instance.status == RecordStatus.PAUSE
                              ? 'resume'
                              : 'pause',
                          color: AppColors.textButtonBlueColor,
                          textColor: Colors.white,
                          onTap: () {
                            returnAudio.pauseRecord();
                          },
                        ),
                        GestureDetectorWidget(
                          text: 'stop',
                          color: Colors.green,
                          textColor: Colors.white,
                          onTap: () {
                            returnAudio.stopRecord();
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        returnAudio.statusText,
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        returnAudio.play();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 30),
                        alignment: AlignmentDirectional.center,
                        width: 100,
                        height: 50,
                        child: returnAudio.isComplete &&
                                returnAudio.recordFilePath != null
                            ? const Text(
                                "play",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
                              )
                            : Container(),
                      ),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}

class GestureDetectorWidget extends StatelessWidget {
  const GestureDetectorWidget(
      {Key? key,
      this.onTap,
      required this.text,
      required this.color,
      required this.textColor})
      : super(key: key);
  final void Function()? onTap;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 48.0,
            decoration: BoxDecoration(color: color),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ),
          )),
    );
  }
}
