import 'package:bloc_pattern_in_flutter/Screens/Practice/Screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/practice_bloc_bar_bloc.dart';

class PracticeRouteName {
  static const String firstPage = "firstPage";
}

class RoutesMethods {
  static Route<dynamic>? onGenerateMethods(RouteSettings settings) {
    if (settings.name == PracticeRouteName.firstPage) {
      return MaterialRoutes(
          child: BlocProvider<PracticeBlocBarBloc>.value(
        value: PracticeBlocBarBloc(),
        child: HomePage(),
      ));
    } else {
      return _errorPage();
    }
  }

  // ! Error Page .
  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text("Not Page Found"))));
  }
}

class MaterialRoutes extends MaterialPageRoute {
  final Widget child;
  MaterialRoutes({required this.child}) : super(builder: (_) => child);
}
