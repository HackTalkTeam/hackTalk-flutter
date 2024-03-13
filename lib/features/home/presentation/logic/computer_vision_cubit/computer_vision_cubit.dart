import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'computer_vision_state.dart';

class ComputerVisionCubit extends Cubit<ComputerVisionState> {
  ComputerVisionCubit() : super(ComputerVisionInitial());

  File? video;

  Future selectVideoPauseFrom() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (image != null) {
      video = File(image.path);
      emit(ComputerVisionVideoFile(video: video));
    }
  }

  Future selectVideoFromCamera() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickVideo(source: ImageSource.camera);
    if (image != null) {
      video = File(image.path);
      emit(ComputerVisionVideoFile(video: video));
    }
  }
}
