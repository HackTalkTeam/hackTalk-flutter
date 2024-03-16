part of 'on_boarding_cubit.dart';

@immutable
abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class NextState extends OnBoardingState {}

class GoToHomeState extends OnBoardingState {}