abstract class SignInStates {}

class SignInInitialStates extends SignInStates {}

class SignInInvalidStates extends SignInStates {}

class SignInValidStates extends SignInStates {}

// ** Show This Error States and show this error message in the (Ui)
class SignInErrorStates extends SignInStates {
  String errorMessage;
  SignInErrorStates(this.errorMessage);
}

class SignInLoadingStates extends SignInStates {}
