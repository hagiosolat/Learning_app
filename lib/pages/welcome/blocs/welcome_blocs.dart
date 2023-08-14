import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/welcome/blocs/welcome_events.dart';
import 'package:u_learning/pages/welcome/blocs/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      print("welcome bloc");
      emit(WelcomeState(page: state.page));
    });
  }
}
