import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hack_talk/core/helpers/cache_helper.dart';
import 'package:hack_talk/core/helpers/dio_helper.dart';
import 'package:hack_talk/core/helpers/endPoints.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/features/auth/models/log_out_model.dart';
import 'package:meta/meta.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(LogOutInitial());

  late LogOutModel logOutModel;

  void logOut() {
    emit(LogOutLoadingState());
    DioHelper.postData(url: Endpoints.logout, data: {}).then((value) {
      logOutModel = LogOutModel.fromJson(value.data);
      CacheHelper.removeToken(key: AppStrings.token);
      log('$LogOutCubit');
      if (logOutModel.status == 1) {
        emit(LogOutSuccessState());
      } else {
        emit(LogOutFailedState(msg: logOutModel.message ?? ''));
      }
    }).catchError((onError) {
      emit(LogOutFailedState(msg: onError.toString()));
      log(onError);
    });
  }
}
