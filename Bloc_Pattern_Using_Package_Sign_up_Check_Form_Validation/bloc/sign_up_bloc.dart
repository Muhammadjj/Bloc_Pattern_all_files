import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:email_validator/email_validator.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    
    on<SignUpTextChangeEvent>((event, emit) {
      if (event.signUpName!.length <= 5 ) {
        emit(SignUpErrorState(errorMessage: "Maximum 5 Character"));
      } 
      else if (EmailValidator.validate("${event.signUpEmail}") == false) {
        emit(SignUpErrorState(errorMessage: "Please Enter A Right Email."));
      }
      else if(event.signUpPassword!.length <= 7){
        emit(SignUpErrorState(errorMessage: "Password Demand 7 character"));
      }
      else{
        emit(SignUpValidState());
      }
    });


    on<SignUpSubmittedButton>((event, emit) {
      emit(SignUpLoadingState());
    });
  }
}
