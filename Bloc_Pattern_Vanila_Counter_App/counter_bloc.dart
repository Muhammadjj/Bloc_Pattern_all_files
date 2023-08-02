import 'dart:async';

import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Vanila_Counter_App/counter_event.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Vanila_Counter_App/counter_state.dart';

class CounterBlocPattern {
  final StreamController<CounterEvent> _eventStreamController = StreamController();
  final StreamController<CounterState> _stateStreamController = StreamController();
  
  // ** ya wo wala events ha jo bhja ja raha ha ui sa 
  StreamSink<CounterEvent> get eventSink {
    return  _eventStreamController.sink;
  }
  Stream<CounterState> get stateStream {
    return _stateStreamController.stream;
  }

  CounterState state = CounterState( 0);
  CounterBlocPattern() {
    _eventStreamController.stream.listen(mapEventToState);
  }

  mapEventToState(event) {
    if (event is IncrementCounterEvent) {
      state = CounterState(state.count + 1);
      _stateStreamController.sink.add(state);
    } else {
      state = CounterState( state.count-1);
      _stateStreamController.sink.add(state);
    }
  }
}
