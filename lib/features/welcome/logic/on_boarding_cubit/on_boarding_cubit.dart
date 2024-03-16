import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/features/welcome/logic/on_boarding_model.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        title: "Welcome to HackTalk!",
        body:
        "Overcome your public speaking anxiety with HackTalk. Explore VR environments and improve your skills through expert analysis",
        image: 'onBoarding1'.getSvgAsset),
    OnBoardingModel(
        title: "Step into real environments ",
        body:
        "Practice in realistic virtual environments with a live audience. Boost your confidence with immersive experiences.",
        image: 'onBoarding2'.getSvgAsset),
    OnBoardingModel(
        title: "Analyze Your Performance",
        body:
        "Our app records your presentations and provides detailed feedback. Identify areas for improvement and track your progress.",
        image: 'onBoarding3'.getSvgAsset),
    OnBoardingModel(
        title: "Practice Anytime, Anywhere",
        body:
        "With HackTalk , you can practice on your terms. Carry your personal speaking coach wherever you go.",
        image: 'onBoarding4'.getSvgAsset),
  ];
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  OnBoardingCubit() : super(OnBoardingInitial()) {
    // if(state )
  }
  changePage(int page) {
    currentPage = page;
    emit(NextState());
  }

  next() {
    if (currentPage >= onBoardingList.length - 1) {
      emit(GoToHomeState());
    } else {
      currentPage++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
      emit(NextState());
    }
  }
}
