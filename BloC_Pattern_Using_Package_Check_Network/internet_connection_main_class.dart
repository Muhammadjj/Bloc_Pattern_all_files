import 'package:bloc_pattern_in_flutter/Screens/BloC_Pattern_Using_Package_Check_Network/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const InterNetConnectionChecking());
}

class InterNetConnectionChecking extends StatelessWidget {
  const InterNetConnectionChecking({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InterNetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ConnectionChecking(),
      ),
    );
  }
}

class ConnectionChecking extends StatefulWidget {
  const ConnectionChecking({super.key});

  @override
  State<ConnectionChecking> createState() => _ConnectionCheckingState();
}

class _ConnectionCheckingState extends State<ConnectionChecking> {
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: Center(
          child: BlocConsumer<InterNetBloc, InternetState>(
        listener: (context, InternetState state) {
          if (state is InterNetGainedState) {
            snackBar(const Text("Happy InterNet Connection"), Colors.green);
          } else if (state is InterNetLostState) {
             snackBar(const Text("Sad News Don,t Connect InterNet "), Colors.red);
          } else {
            snackBar(const Text("Loading..."), Colors.lime);
          }
        },
        builder: (context, state) {
          if (state is InterNetGainedState) {
            return const Center(
                child: Text("Congratulation Connected InterNet ."));
          } else if (state is InterNetLostState) {
            return const Center(
                child: Text(" Sad News!\nDon,t Connection InterNet"));
          } else {
            return const Center(child: Text("Loading......."));
          }
        },
      )),
    );
  }

   snackBar(Text text,Color color){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: text,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5))),);
  }
}





// **
    ///* Bloc Builder ma hm srf apni ui set kr skty ha aur agr hmy koi bloc sa 
    ///* ate hoye stream pr koi condition lgne ha ya listen krna ha to wo hm as 
    ///* ma nhi kr skty  because Bloc using Builder. Builder return type Widget 
    ///* and any widget uses however don,t uses for condition.
    
    ///* As laya agr hm ny bloc sa ate hoye stream ko listen krna ha to hm log 
    ///* (Bloc Consumer) ko use krty ha 
//BlocBuilder<InterNetBloc, InternetState>(
        //   builder: (context, state) {
        //     if (state is InterNetGainedState) {
        //       return const Center(child:  Text("Congratulation Connected InterNet ."));
        //     } else if (state is InterNetLostState) {
        //       return const Center(child:  Text(" Sad News\nDon,t Connection InterNet"));
        //     } else {
        //       return const Center(child:  Text("Loading......."));
        //     }
        //   },
        // ),
        // */
