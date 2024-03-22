import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/helpers/cache_helper.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/features/auth/models/user_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context, listen: false);
  UserModel? userModel;

  changeUserModel(UserModel? user) {
    userModel = user;
    CacheHelper.saveData(
        key: AppStrings.token, value: userModel?.data?.accessToken ?? '');
    emit(UpdateUserState());
  }

  changeUserData({String? email, String? name}) {
    if (email != null) {
      userModel?.data?.userDate?.email = email;
    }
    if (name != null) {
      userModel?.data?.userDate?.name = name;
    }
    emit(UpdateUserState());
  }
}
