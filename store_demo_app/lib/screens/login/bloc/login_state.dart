abstract class LoginScreenState {}

class LoginInitialState extends LoginScreenState {}

class LoginLoadingState extends LoginScreenState {}

class LoginState extends LoginScreenState {
  LoginState();
}

class LoginErrorState extends LoginScreenState {}
