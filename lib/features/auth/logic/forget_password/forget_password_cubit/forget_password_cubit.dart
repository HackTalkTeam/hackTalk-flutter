import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/helpers/dio_helper.dart';
import 'package:hack_talk/core/helpers/endPoints.dart';
import 'package:hack_talk/features/auth/models/forget_password_model.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  late ForgetPasswordModel forgetPasswordModel;

  void resetPassword({
    required String email,
  }) {
    emit(PasswordLoadingState());
    DioHelper.postData(url: Endpoints.resetPassword, data: {
      "email": email,
    }).then((value) {
      forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);
      print('${forgetPasswordModel.message}');
      if (forgetPasswordModel.status == 1) {
        emit(PasswordSuccessState());
      } else {
        emit(PasswordFailedState(msg: forgetPasswordModel.message ?? ''));
      }
    }).catchError((onError) {
      emit(PasswordFailedState(msg: onError.toString()));
      print(onError);
    });
  }
  void verifyCode({
    required String email,
    required String token,
  }) {
    emit(PasswordLoadingState());
    DioHelper.postData(url: Endpoints.verifyCode, data: {
      "email": email,
      "token": token,
    }).then((value) {
      forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);
      print('${forgetPasswordModel.message}');
      if (forgetPasswordModel.status == 1) {
        emit(PasswordSuccessState());
      } else {
        emit(PasswordFailedState(msg: forgetPasswordModel.message ?? ''));
      }
    }).catchError((onError) {
      emit(PasswordFailedState(msg: onError.toString()));
      log(onError);
    });
  }

  void newPassword({
    required String email,
    //required String token,
    required String new_password,
    required String new_password_confirmation,
  }) {
    emit(PasswordLoadingState());
    DioHelper.postData(url: Endpoints.newPassword, data: {
      "email": email,
      //"token": token,
      "new_password": new_password,
      "new_password_confirmation": new_password_confirmation,
    }).then((value) {
      forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);
      log('${forgetPasswordModel.message}');
      if (forgetPasswordModel.status == 1) {
        emit(PasswordSuccessState());
      } else {
        emit(PasswordFailedState(msg: forgetPasswordModel.message ?? ''));
      }
    }).catchError((onError) {
      emit(PasswordFailedState(msg: onError.toString()));
      log(onError);
    });
  }

  void changePassword({
    required String current_password,
    required String new_password,
    required String new_password_confirmation,
  }) {
    emit(PasswordLoadingState());
    DioHelper.postData(url: Endpoints.changePassword, data: {
      "current_password": current_password,
      "new_password": new_password,
      "new_password_confirmation": new_password_confirmation,
    }).then((value) {
      forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);
      log('${forgetPasswordModel.message}');
      if (forgetPasswordModel.status == 1) {
        emit(PasswordSuccessState());
      } else {
        emit(PasswordFailedState(msg: forgetPasswordModel.message ?? ''));
      }
    }).catchError((onError) {
      emit(PasswordFailedState(msg: onError.toString()));
      log(onError);
    });
  }
}
