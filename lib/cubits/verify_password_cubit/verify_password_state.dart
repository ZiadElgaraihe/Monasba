part of 'verify_password_cubit.dart';

@immutable
abstract class VerifyPasswordState {}

class VerifyPasswordInitial extends VerifyPasswordState {}

class VerifyPasswordLoading extends VerifyPasswordState {}
class VerifyPasswordSuccess extends VerifyPasswordState {}
class VerifyPasswordFailure extends VerifyPasswordState {
  VerifyPasswordFailure({required this.error});

  final String error;
}
