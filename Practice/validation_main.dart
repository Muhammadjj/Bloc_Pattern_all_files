import 'package:bloc_pattern_in_flutter/Screens/Practice/Screen/routes_method.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const PracticeBloc());
}

class PracticeBloc extends StatelessWidget {
  const PracticeBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey, useMaterial3: true),
      initialRoute: PracticeRouteName.firstPage,
      onGenerateRoute: RoutesMethods.onGenerateMethods,
    );
  }
}
