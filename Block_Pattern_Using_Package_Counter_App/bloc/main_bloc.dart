import 'package:bloc_pattern_in_flutter/Screens/Block_Pattern_Using_Package_Counter_App/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const BlocPattern());
}

class BlocPattern extends StatelessWidget {
  const BlocPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const BlocCounterApp(),
      ),
    );
  }
}

class BlocCounterApp extends StatefulWidget {
  const BlocCounterApp({super.key});
  
  @override
  State<BlocCounterApp> createState() => _BlocCounterAppState();
}

class _BlocCounterAppState extends State<BlocCounterApp> {
  @override
  Widget build(BuildContext context) {
    print("Block Pattern With Package");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:',),
            BlocBuilder<CounterBloc, CounterState>(
              bloc: context.read<CounterBloc>(),
              builder: (context, state) {
                return Text( "${state.count}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton(
          onPressed: () {
            _incrementedNumber();
          },
          child:const Icon(Icons.add),
        ),

        FloatingActionButton(onPressed: (){
          context.read<CounterBloc>().add(DecrementCountEvent());
        },
        child:const Icon(Icons.remove_circle),)
        ]
      ),
    );
  }

  void _incrementedNumber() {
    context.read<CounterBloc>().add(IncrementCounterEvent());
  }
}
