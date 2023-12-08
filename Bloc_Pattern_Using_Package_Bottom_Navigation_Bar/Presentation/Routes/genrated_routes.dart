import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Using_Package_Bottom_Navigation_Bar/Presentation/Screen/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Business_Logic/bloc/landing_page_bottom_navigation_bloc.dart';

class RoutesName {
  static const navigatorPage = "BottomNavigationPage";
}

class RoutesMethod {
  // static final LandingPageBottomNavigationBloc landingPage =
  //     LandingPageBottomNavigationBloc();

  static Route<dynamic>? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.navigatorPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LandingPageBottomNavigationBloc>.value(
                  value: LandingPageBottomNavigationBloc(),
                  child: LandingPageBloc(),
                ));

      default:
        return _errorRoutes();
    }
  }

  static Route<dynamic> _errorRoutes() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text("Error Not Page Found"),
            )));
  }
}
