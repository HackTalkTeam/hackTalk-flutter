import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioInitial());

  File? anyFile;

  Future<File?> selectFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['mp3', 'm4v']
    );
    if (result != null && result.files.single.path != null) {
      anyFile = File(result.files.single.path!);
      return anyFile;
    }
    return null;
  }

  //----------------------------------------------------------
  //----------------------------------------------------------

  String statusText = "";
  bool isComplete = false;

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  bool isRecording = false;
  bool isPause = false;
  Timer? timer;
  int allSeconds = 0;

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath!, (type) {
        statusText = "Record error--->$type";
      });
      isRecording = true;
      isPause = false;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        allSeconds++;
        int hours = allSeconds ~/ 3600;
        int minutes = (allSeconds - (hours * 3600)) ~/ 60;
        int seconds = (allSeconds - (hours * 3600) - (minutes * 60));

        emit(DurationRecordInitial(second: seconds, minutes: minutes, hours: hours));
      });
    } else {
      statusText = "No microphone permission";
    }
    emit(StartRecordInitial());
  }

  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      // isRecording = true;
      // isPause = true;
      if (s) {
        statusText = "Recording...";
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
      }
    }
    emit(PauseRecordInitial());
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      isPause = true;
      isRecording = false;
      allSeconds = 0;
      timer?.cancel();
      emit(StopRecordInitial());
    }
  }

  void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      emit(ResumeRecordInitial());
    }
  }

  String? recordFilePath;

  void play() {
    if (recordFilePath != null && File(recordFilePath!).existsSync()) {
      AudioPlayer audioPlayer = AudioPlayer();
      audioPlayer.play(UrlSource(recordFilePath!));
    }
  }

  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = "${storageDirectory.path}/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return "$sdPath/test_${i++}.wav";
  }

  // Future<File?> getAudioRecord() async {
  //   Directory storageDirectory = await getApplicationDocumentsDirectory();
  //   String sdPath = "${storageDirectory.path}/record";
  //   var d = Directory(sdPath);
  //   if (!d.existsSync()) {
  //     d.createSync(recursive: true);
  //   }
  //   return File("$sdPath/test_${i++}.wav");
  // }
}
