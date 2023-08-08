import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Using_Package_Sign_In_Check_Form_Validation/Bloc/sign_in_events.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Using_Package_Sign_In_Check_Form_Validation/Bloc/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
class SignInBloc extends Bloc<SignInEvents,SignInStates>{
  SignInBloc(): super(SignInInitialStates()){
    // ** First (on method) .
    on<SignInTextChangeEvents>((event, emit) {
      if(EmailValidator.validate("${event.emailValue}")== false){
        emit(SignInErrorStates("Please Enter A Valid Email Address ."));
      }
      else if(event.passwordValue!.length <= 7){
        emit(SignInErrorStates("Maximum 7 Character "));
      }
      else{
        emit(SignInValidStates());
      }
    });

    // ** Second (on method) .
    on<SignInSubmittedButtonEvent>((event, emit) {
      emit(SignInLoadingStates());
    });
  }
}