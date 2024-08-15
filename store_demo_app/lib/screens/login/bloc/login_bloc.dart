import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/screens/login/bloc/bloc.dart';
import 'package:store_demo_app/screens/login/repo/login_repo.dart';

class LoginBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginRepo loginRepo = LoginRepo();

  LoginBloc() : super(LoginInitialState()) {
    on<LoginScreenEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState());
        try {
          await loginRepo.login(
              event.userName!, event.password!, event.context);
          emit(LoginState());
        } catch (e) {
          emit(LoginErrorState());
        }
      }
    });
  }
}
