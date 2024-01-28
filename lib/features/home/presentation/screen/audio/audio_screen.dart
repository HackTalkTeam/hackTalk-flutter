import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/logic/audio_cubit/audio_cubit.dart';
import 'package:hack_talk/features/home/presentation/screen/Audio/record_audio_screen.dart';
import 'package:hack_talk/features/home/presentation/widgets/home_button_widget.dart';
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
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 22),
                      const TextWidget(
                        "Welcome to the world of confident communication! Your journey starts now. Would you like to seize the moment and record your presentation live, or do you have a pre-recorded presentation ready to analyse",
                        maxLines: 4,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBodyColor,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 600,
                        child: ContainedTabBarView(
                          tabs: const [
                            SizedBox(),
                            SizedBox(),
                          ],
                          views: [
                            Column(
                              children: [
                                SvgPicture.asset(
                                    'start recording image audio'.getSvgAsset),
                                const SizedBox(height: 27),
                                HomeButtonWidget(
                                  color: AppColors.textButtonBlueColor,
                                  text: 'Start recording ',
                                  onPressed: () {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((timeStamp) {
                                      AppRoutes.routeTo(
                                          context, const RecordAudioScreen());
                                    });
                                  },
                                  textColor: AppColors.homeButtonColor,
                                  image: 'Upload video',
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                    'start download image audio'.getSvgAsset),
                                HomeButtonWidget(
                                  color: AppColors.textButtonBlueColor,
                                  text: 'Upload voice',
                                  onPressed: () async {
                                    await returnAudio.selectFiles();
                                  },
                                  textColor: AppColors.homeButtonColor,
                                  image: 'Upload video',
                                ),
                              ],
                            ),
                          ],
                          onChange: (index) => print(index),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
