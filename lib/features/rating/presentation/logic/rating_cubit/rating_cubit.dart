import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());

  int rate = 0;
  void updateRate(double rating) {
    rate = rating ~/ 1;
    emit(RatingUpdate(rate: rate));
  }
}
