part of 'log_out_cubit.dart';

@immutable
abstract class LogOutState {}

class LogOutInitial extends LogOutState {}

class LogOutLoadingState extends LogOutState {}

class LogOutSuccessState  extends LogOutState {}

class LogOutFailedState  extends LogOutState {
  final String msg;
  LogOutFailedState ({required this.msg});
}
