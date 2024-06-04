part of 'cv_result_cubit.dart';

@immutable
abstract class CvResultState {}

class CvResultInitial extends CvResultState {}
class CvResultLoadingState extends CvResultState {}
class CvResultShowResultState extends CvResultState {}
