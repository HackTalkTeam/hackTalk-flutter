part of 'contact_us_cubit.dart';

@immutable
abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}
class ContactUsLoadingState extends ContactUsState {}

class ContactUsSuccessState  extends ContactUsState {}

class ContactUsFailedState  extends ContactUsState {
  final String msg;
  ContactUsFailedState ({required this.msg});
}
