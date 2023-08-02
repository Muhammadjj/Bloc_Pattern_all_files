import 'package:bloc_pattern_in_flutter/Screens/Cubit_Pattern_Using_Package_Check_Network/internet_cubit.dart';
import 'package:bloc_pattern_in_flutter/Screens/Cubit_Pattern_Using_Package_Check_Network/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const NetWorkCheckingUsingCubit());
}

class NetWorkCheckingUsingCubit extends StatelessWidget {
  const NetWorkCheckingUsingCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InterNetCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: const CubitClass(),
      ),
    );
  }
}

class CubitClass extends StatefulWidget {
  const CubitClass({super.key});

  @override
  State<CubitClass> createState() => _CubitClassState();
}

class _CubitClassState extends State<CubitClass> {
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      backgroundColor: Colors.lime,
      appBar: AppBar(title:const  Text("Cubit Using NetWork States ."),centerTitle: true,),
      body: Center(
        child: BlocConsumer<InterNetCubit, InternetCubicStates>(
          listener: (context, state) {
            if (state is InterNetGainedStates) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Happy InterNet Connected This Device.",),
                backgroundColor: Colors.green,));
            } else if(state is InterNetLostStates){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Oh InterNet Don't Connected."),
                backgroundColor: Colors.red,));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Loading........"),));
            }
          },
          builder: (context, state) {
            if (state is InterNetGainedStates) {
              return const Text("Happy InterNet Connected This Device.");
            } else if(state is InterNetLostStates){
              return const Text("Oh InterNet Don't Connected.");
            }else{
              return const Text("Loading.......");
            }
          },
        ),
      ),
    );
  }
}
