part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class PasswordLoadingState extends ForgetPasswordState {}

class PasswordSuccessState extends ForgetPasswordState {}

class PasswordFailedState extends ForgetPasswordState {
  final String msg;
  PasswordFailedState({required this.msg});
}
