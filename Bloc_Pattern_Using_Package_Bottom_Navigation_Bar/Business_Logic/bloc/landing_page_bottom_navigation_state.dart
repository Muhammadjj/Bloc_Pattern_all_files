part of 'landing_page_bottom_navigation_bloc.dart';

@immutable
sealed class LandingPageBottomNavigationState {
  final int tabIndex;
  const LandingPageBottomNavigationState({required this.tabIndex});
}

final class LandingPageBottomNavigationInitial
    extends LandingPageBottomNavigationState {
  const LandingPageBottomNavigationInitial({required super.tabIndex});
}
