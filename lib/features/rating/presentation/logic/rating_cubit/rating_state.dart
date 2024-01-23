part of 'rating_cubit.dart';

@immutable
abstract class RatingState {}

class RatingInitial extends RatingState {}

class RatingUpdate extends RatingState {
  final int rate;

  RatingUpdate({required this.rate});
}
