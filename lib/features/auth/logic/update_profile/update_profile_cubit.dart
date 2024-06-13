import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hack_talk/core/helpers/dio_helper.dart';
import 'package:hack_talk/core/helpers/endPoints.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/features/auth/logic/app_cubit/app_cubit.dart';
import 'package:hack_talk/features/auth/models/profile_model.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  ProfileModel? updateProfileModel;

  void profile({
    required String name,
    required String email,
  }) {
    emit(UpdateProfileLoadingState());
    DioHelper.postData(url: Endpoints.profile, data: {
      "name": name,
      "email": email,
    }).then((value) {
      updateProfileModel = ProfileModel.fromJson(value.data);

      log('${updateProfileModel?.message}');
      if (updateProfileModel?.status == 1) {
        AppCubit.get(AppNavigator.context).changeUserData(
            email: updateProfileModel?.data?.email,
            name: updateProfileModel?.data?.name);
        emit(UpdateProfileSuccessState());
      } else {
        emit(LUpdateProfileFailedState(msg: updateProfileModel?.message ?? ''));
      }
    }).catchError((onError) {
      emit(LUpdateProfileFailedState(msg: onError.toString()));
      log(onError);
    });
  }
}
