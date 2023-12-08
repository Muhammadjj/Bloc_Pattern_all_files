import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Vanila_Counter_App/counter_bloc.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Vanila_Counter_App/counter_event.dart';
import 'package:flutter/material.dart';

import 'counter_state.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final CounterBlocPattern _counterBloc = CounterBlocPattern();

  @override
  Widget build(BuildContext context) {
    debugPrint("object");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder<CounterState>(
          initialData: CounterState(count: 0),
          stream: _counterBloc.stateStream,
          builder: (context, AsyncSnapshot<CounterState> snapshot) {
            return Text("Counter Value is ${snapshot.data!.count}");
          },
        ),
      ),
      floatingActionButton: ButtonBar(children: [
        FloatingActionButton(
          onPressed: () {
            _counterBloc.eventSink.add(IncrementCounterEvent());
          },
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            _counterBloc.eventSink.add(DecrementCountEvent());
          },
          child: const Icon(Icons.remove),
        ),
      ]),
    );
  }
}
