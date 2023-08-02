part of 'user_bloc.dart';

@immutable
abstract class UserState {}


@immutable
class UserInitialState extends UserState {}


///* No Data Fetch But Loading state .
@immutable
class UserLoadingState extends UserState {}


///* All Data Loaded state   
@immutable
class UserLoadedState extends UserState {
  final List<UsersJsonParentFiles> user;
  UserLoadedState({required this.user});
}


///* Error Message State .
@immutable
class UserErrorState extends UserState {
  final String errorMessage;
  UserErrorState({required this.errorMessage});
}
