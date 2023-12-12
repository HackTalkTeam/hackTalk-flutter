import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hack_talk/features/welcome/domain/use_cases/auto_login_usecase.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AutoLoginUseCase autoLoginUseCase;
  SplashCubit({required this.autoLoginUseCase}) : super(SplashInitial()){
    autoLoginUseCase();
    if(state is SplashInitial){
      goToNextPage(4);
    }
  }

  Future<void> goToNextPage(int time) async {
    await Future.delayed(Duration(seconds: time), () async {
      emit(NextPageState());
    });
  }
}
