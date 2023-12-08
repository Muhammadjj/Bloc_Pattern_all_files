// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'landing_page_bottom_navigation_event.dart';
part 'landing_page_bottom_navigation_state.dart';

class LandingPageBottomNavigationBloc extends Bloc<
    LandingPageBottomNavigationEvent, LandingPageBottomNavigationState> {
  LandingPageBottomNavigationBloc()
      : super(const LandingPageBottomNavigationInitial(tabIndex: 0)) {
    on<LandingPageBottomNavigationEvent>((event, emit) {
      // ! Change Indexes .
      if (event is TabChange) {
        emit(LandingPageBottomNavigationInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
