import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_state.dart';

class InterNetCubit extends Cubit<InternetCubicStates> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription? _streamSubscription;

  InterNetCubit() : super(InterNetInitialStates()) 
  {
    _streamSubscription =_connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.other) {
        emit(InterNetGainedStates());
      } else {
        emit(InterNetLostStates());
      }
    });

  }



  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
