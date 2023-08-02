import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_APIs_Self_Practice/Pages/user_widget.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_APIs_Self_Practice/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageApis extends StatefulWidget {
  const HomePageApis({super.key});

  @override
  State<HomePageApis> createState() => _HomePageApisState();
}

class _HomePageApisState extends State<HomePageApis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(listener: (context, state) {
        if (state is UserLoadedState) {
          showSnackBar(text: "Fetch User APIs Data ");
        }
      }, builder: (context, state) {
        if (state is UserInitialState) {
          return const UserInitialWidget();
        } else if (state is UserLoadingState) {
          return const UserLoadingWidget();
        } else if (state is UserLoadedState) {
          return UserLoadedWidget(
            user: state.user,
          );
        } else {
          return UserErrorMessage(
            error: (state as UserErrorState).errorMessage,
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
          elevation: 20,
          onPressed: () {
            context.read<UserBloc>().add(FetchUserAllDataEvent());
          },
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  showSnackBar({String text = ''}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      elevation: 10,
      dismissDirection: DismissDirection.horizontal,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: Colors.green.shade600,
      behavior: SnackBarBehavior.floating,
    ));
  }
}
