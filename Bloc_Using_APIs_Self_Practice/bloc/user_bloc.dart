import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_APIs_Self_Practice/user_json_class/user_json.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_APIs_Self_Practice/user_meth_provider.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';   

class UserBloc extends Bloc<UserEvent, UserState> {
  var data = ApiMethod();

  UserBloc() : super(UserInitialState()) {

    on<FetchUserAllDataEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        var userData = await data.fetch();
        emit(UserLoadedState(user: userData));
      } catch (e) {
        emit(UserErrorState(errorMessage: "Exception Error : ${e.toString()}"));
      }
    });
  }
}
