part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoadingState extends UpdateProfileInitial {}

class UpdateProfileSuccessState  extends UpdateProfileInitial {}

class LUpdateProfileFailedState  extends UpdateProfileInitial {
  final String msg;
  LUpdateProfileFailedState ({required this.msg});
}