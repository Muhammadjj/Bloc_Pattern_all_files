// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // ** We are most needed Initial State but dyna (super parameter) ma ha .
  CounterBloc() : super(const CounterState(count: 0)) {
    on<IncrementCounterEvent>(
        (event, emit) => emit(CounterState(count: state.count + 1)));
    on<DecrementCountEvent>(
        (event, emit) => emit(CounterState(count: state.count - 1)));
  }
}
