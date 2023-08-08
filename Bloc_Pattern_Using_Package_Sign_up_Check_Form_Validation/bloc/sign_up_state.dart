part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

@immutable
class SignUpInitialState extends SignUpState {}

@immutable
class SignUpInvalidState extends SignUpState {}

@immutable
class SignUpValidState extends SignUpState {}

@immutable
class SignUpErrorState extends SignUpState {
  final String? errorMessage;
  SignUpErrorState({this.errorMessage});
}


@immutable
class SignUpLoadingState extends SignUpState{}