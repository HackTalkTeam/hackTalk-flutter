part of 'computer_vision_cubit.dart';

@immutable
abstract class ComputerVisionState {}

class ComputerVisionInitial extends ComputerVisionState {}

class ComputerVisionVideoFile extends ComputerVisionState {
  final File? video;
  ComputerVisionVideoFile({required this.video});
}
