part of 'audio_result_cubit.dart';

@immutable
abstract class AudioResultState {}

class AudioResultInitial extends AudioResultState {}
class AudioResultLoadingInitial extends AudioResultState {}
class AudioShowResultInitial extends AudioResultState {}
