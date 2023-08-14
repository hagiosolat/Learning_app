import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/sign_in/bloc/signin_events.dart';
import 'package:u_learning/pages/sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>((event, emit) {
     // print("my email is ${event.email}");
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      //print("my password is ${event.password}");
      emit(state.copyWith(password: event.password));
    });
  }
}
