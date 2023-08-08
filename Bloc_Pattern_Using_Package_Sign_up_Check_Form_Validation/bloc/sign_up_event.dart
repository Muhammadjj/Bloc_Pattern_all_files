part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

@immutable
class SignUpTextChangeEvent extends SignUpEvent {
  final String? signUpName;
  final String? signUpEmail;
  final String? signUpPassword;
  SignUpTextChangeEvent(
      {this.signUpName, this.signUpEmail, this.signUpPassword});
}



@immutable
class SignUpSubmittedButton extends SignUpEvent {
  final String? submittedButtonName;
  final String? submittedButtonEmail;
  final String? submittedButtonPassword;
  SignUpSubmittedButton(
      {this.submittedButtonName,
      this.submittedButtonEmail,
      this.submittedButtonPassword});
}
