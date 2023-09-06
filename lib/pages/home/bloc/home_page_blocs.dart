import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/home/bloc/home_page_events.dart';
import 'package:u_learning/pages/home/bloc/home_page_state.dart';

class HomePageBlocs extends Bloc<HomePageEvent, HomePageState> {
  HomePageBlocs() : super(HomePageState(index: 0)) {
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
