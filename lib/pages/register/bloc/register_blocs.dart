import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/register/bloc/register_events.dart';
import 'package:u_learning/pages/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UserNameEvent>((event, emit) {
      print("Username: ${event.userName}");
      emit(state.copywith(userName: event.userName));
    });

    on<EmailEvent>((event, emit) {
      print("Email: ${event.email}");
      emit(state.copywith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      print("Password: ${event.password}");
      emit(state.copywith(password: event.password));
    });
    on<RePasswordEvent>((event, emit) {
      print("Repassword: ${event.rePassword}");
      emit(state.copywith(rePassword: event.rePassword));
    });
  }
}
