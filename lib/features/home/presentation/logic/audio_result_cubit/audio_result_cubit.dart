import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/helpers/dio_helper.dart';
import 'package:hack_talk/core/helpers/endPoints.dart';
import 'package:hack_talk/features/home/presentation/model/audio_result_model.dart';
import 'package:meta/meta.dart';

part 'audio_result_state.dart';

class AudioResultCubit extends Cubit<AudioResultState> {
  AudioResultCubit() : super(AudioResultInitial());

  static AudioResultCubit get(context) => BlocProvider.of(context);
  AudioResultModel? audioResultModel;
  Future showAudioResult(File file) async {
    emit(AudioResultLoadingInitial());
    await DioHelper.postAi(
      url: Endpoints.audio,
      data: FormData.fromMap(
        {
          "file": await MultipartFile.fromFile(file.path),
        },
      ),
    ).then((value) {
      audioResultModel = AudioResultModel.fromJson(value.data);
    });
    emit(AudioShowResultInitial());
  }
}
