part of 'landing_page_bottom_navigation_bloc.dart';

@immutable
sealed class LandingPageBottomNavigationEvent {
  final int tabIndex;
  const LandingPageBottomNavigationEvent({required this.tabIndex});
}

class TabChangeEvent extends LandingPageBottomNavigationEvent {
  const TabChangeEvent({required super.tabIndex});

  // final int tabIndex;
  // TabChange({required this.tabIndex});
}
