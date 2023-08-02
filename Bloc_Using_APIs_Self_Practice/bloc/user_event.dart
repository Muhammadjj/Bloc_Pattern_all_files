part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

/// * Request this Bloc (FetchUserAllDataEvent) and process the bloc .
@immutable
class FetchUserAllDataEvent extends UserEvent{}