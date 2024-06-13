import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/helpers/cache_helper.dart';
import 'package:hack_talk/core/helpers/dio_helper.dart';
import 'package:hack_talk/core/helpers/endPoints.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/features/drawer/setting/contact_us/logic/contact_us_model.dart';
import 'package:meta/meta.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

static ContactUsCubit get(context) => BlocProvider.of(context);

late ContactUsModel contactUsModel;

void sendMessage({
  required String email,
  required String full_name,
  required String message,
}) {
  emit(ContactUsLoadingState());
  DioHelper.postData(url: Endpoints.sendMessage, data: {
    "email": email,
    "full_name": full_name,
    "message": message,
  }).then((value) {
    contactUsModel = ContactUsModel.fromJson(value.data);
    log('${contactUsModel.message}');
    if (contactUsModel.status == 1) {
      emit(ContactUsSuccessState());
    } else {
      emit(ContactUsFailedState(msg: contactUsModel.message ?? ''));
    }
  }).catchError((onError) {
    emit(ContactUsFailedState(msg: onError.toString()));
    log(onError);
  });
}

}
