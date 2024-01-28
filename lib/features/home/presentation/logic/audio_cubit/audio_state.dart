part of 'audio_cubit.dart';

@immutable
abstract class AudioState {}

class AudioInitial extends AudioState {}

class AudionFile extends AudioState {
  final File? audio;
  AudionFile({required this.audio});
}

class StartRecordInitial extends AudioState {}

class PauseRecordInitial extends AudioState {}

class StopRecordInitial extends AudioState {}

class ResumeRecordInitial extends AudioState {}

class DurationRecordInitial extends AudioState {
  final int second;
  final int minutes;
  final int hours;
  DurationRecordInitial({required this.second, required this.minutes, required this.hours});
}
