import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_demo_app/screens/signup/bloc/bloc.dart';
import 'package:store_demo_app/screens/signup/repo/signup_repo.dart';

class SignUpBloc extends Bloc<SignUpScreenEvent, SignUpScreenState> {
  SignUpRepo signUpRepo = SignUpRepo();

  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpScreenEvent>((event, emit) async {
      if (event is SignUpEvent) {
        emit(SignUpLoadingState());
        try {
          await signUpRepo.signUp(
              event.userName!, event.email!, event.password!, event.context);
          emit(SignUpState());
        } catch (e) {
          emit(SignUpErrorState());
        }
      }
    });
  }
}
