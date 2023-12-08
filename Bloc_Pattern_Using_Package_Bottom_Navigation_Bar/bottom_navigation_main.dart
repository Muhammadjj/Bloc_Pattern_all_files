import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Using_Package_Bottom_Navigation_Bar/Presentation/Routes/genrated_routes.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const BlocUsingBottomNavigationBar());
}

class BlocUsingBottomNavigationBar extends StatelessWidget {
  const BlocUsingBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey, useMaterial3: true),
      initialRoute: RoutesName.navigatorPage,
      onGenerateRoute: RoutesMethod.onGeneratedRoutes,
    );
  }
}
