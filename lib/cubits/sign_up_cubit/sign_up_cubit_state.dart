part of 'sign_up_cubit_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpCubitInitial extends SignUpState {}

class SignUpCubitLoading extends SignUpState {}

class SignUpCubitSuccess extends SignUpState {}

class SignUpCubitFailed extends SignUpState {
  SignUpCubitFailed({required this.error});

  final String error;
}
