import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/helpers/dio_helper.dart';
import 'package:hack_talk/core/helpers/endPoints.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/features/auth/logic/app_cubit/app_cubit.dart';
import 'package:hack_talk/features/auth/models/user_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? loginModel;

  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: Endpoints.login, data: {
      "email": email,
      "password": password,
    }).then((value) {
      loginModel = UserModel.fromJson(value.data);
      log('${loginModel?.message}');
      if (loginModel?.status == 1) {
        AppCubit.get(AppNavigator.context).changeUserModel(loginModel);
        emit(LoginSuccessState());
      } else {
        emit(LoginFailedState(msg: loginModel?.message ?? ''));
      }
    }).catchError((onError) {
      emit(LoginFailedState(msg: onError.toString()));
      log(onError);
    });
  }

  // static LoginCubit get(context) => BlocProvider.of(context);
  //
  // late LoginModel loginModel;
  //
  // void login({
  //   required String email,
  //   required String password,
  // }) {
  //   emit(LoginLoadingState());
  //   DioHelper.postData(url: Endpoints.login, data: {
  //     "email": email,
  //     "password": password,
  //   }).then((value) {
  //     loginModel = LoginModel.fromJson(value.data);
  //     print('${loginModel.message}');
  //     if (loginModel.status == 1) {
  //       CacheHelper.saveData(
  //           key: AppStrings.token, value: loginModel.data?.accessToken ?? '');
  //       emit(LoginSuccessState());
  //     } else {
  //       emit(LoginFailedState(msg: loginModel.message ?? ''));
  //     }
  //   }).catchError((onError) {
  //     emit(LoginFailedState(msg: onError.toString()));
  //     print(onError);
  //   });
  // }
}
