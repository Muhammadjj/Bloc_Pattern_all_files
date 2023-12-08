import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Using_Package_Sign_In_Check_Form_Validation/Bloc/sign_in_bloc.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Using_Package_Sign_In_Check_Form_Validation/Bloc/sign_in_events.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Using_Package_Sign_In_Check_Form_Validation/Bloc/sign_in_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const SignInMaterialPage());
}

class SignInMaterialPage extends StatelessWidget {
  const SignInMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(), child: const SignInMainPage()),
    );
  }
}

class SignInMainPage extends StatefulWidget {
  const SignInMainPage({super.key});

  @override
  State<SignInMainPage> createState() => _SignInMainPageState();
}

class _SignInMainPageState extends State<SignInMainPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("object");
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            BlocBuilder<SignInBloc, SignInStates>(
              builder: (context, state) {
                if (state is SignInErrorStates) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 17),
                  );
                } else {
                  return const SizedBox(
                    height: 0,
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: email,
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context, listen: false).add(
                    SignInTextChangeEvents(
                        emailValue: email.text, passwordValue: password.text));
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: "Enter Email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: password,
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context, listen: false).add(
                    SignInTextChangeEvents(
                        emailValue: email.text, passwordValue: password.text));
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: "Enter Password",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInStates>(
              builder: (context, state) {
                if (state is SignInLoadingStates) {
                  return const CircularProgressIndicator();
                }

                return CupertinoButton(
                  onPressed: () {
                    if (state is SignInValidStates) {
                      BlocProvider.of<SignInBloc>(context, listen: false).add(
                          SignInSubmittedButtonEvent(
                              email: email.text, password: password.text));
                    }
                  },
                  color:
                      (state is SignInValidStates) ? Colors.green : Colors.grey,
                  child: const Text("Sign In "),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
