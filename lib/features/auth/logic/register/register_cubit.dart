import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/helpers/dio_helper.dart';
import 'package:hack_talk/core/helpers/endPoints.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/features/auth/logic/app_cubit/app_cubit.dart';
import 'package:hack_talk/features/auth/models/user_model.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  UserModel? registerModel;

  void register({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: Endpoints.register, data: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
    }).then((value) {
      registerModel = UserModel.fromJson(value.data);
      //CacheHelper.saveData(key: AppStrings.token, value: registerModel.data?.accessToken??'');
      log('$UserModel');
      if (registerModel?.status == 1) {
        AppCubit.get(AppNavigator.context).changeUserModel(registerModel);
        emit(RegisterSuccessState());
      } else {
        emit(RegisterFailedState(msg: registerModel?.message ?? ''));
      }
      // if (registerModel.status == 1) {
      //   emit(RegisterSuccessState());
      // } else {
      //   emit(RegisterFailedState(msg: registerModel.message ?? ''));
      // }
    }).catchError((onError) {
      emit(RegisterFailedState(msg: onError.toString()));
      log(onError);
    });
  }

  // late RegisterModel registerModel;
  //
  // void register({
  //   required String name,
  //   required String email,
  //   required String password,
  //   required String password_confirmation,
  // }) {
  //   emit(RegisterLoadingState());
  //   DioHelper.postData(url: Endpoints.register, data: {
  //     "name": name,
  //     "email": email,
  //     "password": password,
  //     "password_confirmation": password_confirmation,
  //   }).then((value) {
  //     registerModel = RegisterModel.fromJson(value.data);
  //     CacheHelper.saveData(key: AppStrings.token, value: registerModel.data?.accessToken??'');
  //     print('${RegisterModel}');
  //     if(registerModel.status==1){
  //       emit(RegisterSuccessState());
  //     }else{
  //       emit(RegisterFailedState(msg: registerModel.message??''));
  //     }
  //   }).catchError((onError) {
  //     emit(RegisterFailedState(msg: onError.toString()));
  //     print(onError);
  //   });
  // }
}
