// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InterNetBloc extends Bloc<InternetEvent, InternetState> {


  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

 
///* Below this code Current Class Constructor and Parent(Super) Class means (Bloc) 
///**class must needed (InitialState) and start the body  on<>((event,emit)) working .
  InterNetBloc() : super(InterNetInitialState()) {
    on<InterNetLoseEvent>((event, emit) => emit(InterNetLostState()));
    on<InterNetGainedEvent>((event, emit) => emit(InterNetGainedState()));

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((netWorkResult) {
      if (netWorkResult == ConnectivityResult.mobile || netWorkResult == ConnectivityResult.wifi || netWorkResult == ConnectivityResult.other) {
        add(InterNetGainedEvent());
      } else {
        add(InterNetLoseEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
