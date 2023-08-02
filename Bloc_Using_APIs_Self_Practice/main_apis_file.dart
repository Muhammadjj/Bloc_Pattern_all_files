import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_APIs_Self_Practice/Pages/home_page_widget.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_APIs_Self_Practice/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const BlocApisMaterial());
}

class BlocApisMaterial extends StatelessWidget {
  const BlocApisMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home:  BlocProvider<UserBloc>(
        create: (context) => UserBloc(),
        child: const HomePageApis(),
      ),
    );
  }
}
