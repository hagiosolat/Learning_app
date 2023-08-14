import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/application/bloc/apllication_states.dart';
import 'package:u_learning/pages/application/bloc/application_events.dart';

class AppBlocs extends Bloc<AppEvent, AppStates> {
  AppBlocs() : super(const AppStates()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppStates(index: event.index));
    });
  }
}
