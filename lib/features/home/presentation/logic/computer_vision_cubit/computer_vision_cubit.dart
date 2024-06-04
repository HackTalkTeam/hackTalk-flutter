import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

part 'computer_vision_state.dart';

class ComputerVisionCubit extends Cubit<ComputerVisionState> {
  ComputerVisionCubit() : super(ComputerVisionInitial());

  File? video;
  VideoPlayerController? videoController;

  Future<File?> selectVideoPauseFrom() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (image != null) {
      video = File(image.path);
      videoController = VideoPlayerController.file(video!)..initialize();
      return video;
      //emit(ComputerVisionVideoFile(video: video));
    }
    return null;
  }

  Future<File?> selectVideoFromCamera() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickVideo(source: ImageSource.camera);
    if (image != null) {
      video = File(image.path);
      videoController = VideoPlayerController.file(video!)..initialize();
      return video;
      //emit(ComputerVisionVideoFile(video: video));
    }
    return null;
  }
}
