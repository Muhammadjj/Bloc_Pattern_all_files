import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Using_Package_Sign_up_Check_Form_Validation/bloc/sign_up_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const SignUpMaterialPage());
}

class SignUpMaterialPage extends StatelessWidget {
  const SignUpMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(),
        child: const SignUpBlocPage(),
      ),
    );
  }
}

class SignUpBlocPage extends StatefulWidget {
  const SignUpBlocPage({super.key});

  @override
  State<SignUpBlocPage> createState() => _SignUpBlocPageState();
}

class _SignUpBlocPageState extends State<SignUpBlocPage> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const SizedBox(height: 20,),
           BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state is SignUpErrorState) {
                return  Text(state.errorMessage.toString(),
                style: const TextStyle(color:Colors.red,fontSize: 20,fontStyle: FontStyle.italic),); 
              }else{
                return const SizedBox(height: 0,);
              }
            },
          ),

          const SizedBox(height: 20,),
          TextField(
            controller: name,
            onChanged: (value) {
              BlocProvider.of<SignUpBloc>(context).add(SignUpTextChangeEvent(
                signUpName: name.text,signUpEmail: email.text,signUpPassword: password.text));
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)),),
              hintText: "Enter Your Name .",
              prefixIcon: Icon(Icons.person)),
          ),

          const SizedBox(height: 20,),
          TextField(
            controller: email,
            onChanged: (value) {
              BlocProvider.of<SignUpBloc>(context).add(SignUpTextChangeEvent(
                signUpName: name.text,signUpEmail: email.text,signUpPassword: password.text));
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)),),
              hintText: "Enter Your Email .",
              prefixIcon: Icon(Icons.person)),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: password,
            onChanged: (value) {
              BlocProvider.of<SignUpBloc>(context).add(SignUpTextChangeEvent(
               signUpName: name.text,signUpEmail: email.text,signUpPassword: password.text));
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)),),
              hintText: "Enter Your Password .",
              prefixIcon: Icon(Icons.person)),
          ),

          const SizedBox(height: 40,),
          BlocBuilder<SignUpBloc,SignUpState>(
            builder: (context, state) {
             if (state is SignUpLoadingState) {
               return const CircularProgressIndicator.adaptive();
              }
            return  CupertinoButton(onPressed: (){
              if (state is SignUpValidState) {
                print("object");
                BlocProvider.of<SignUpBloc>(context).add(SignUpSubmittedButton(
                  submittedButtonName: name.text,submittedButtonEmail: email.text,submittedButtonPassword: password.text));
              }
            },
            color:(state is SignUpValidState)? Colors.red:Colors.grey,
            child: const Text("Sign Up "));
            },
            
          )
        ],
      ),
    );
  }
}
