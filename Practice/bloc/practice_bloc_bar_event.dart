part of 'practice_bloc_bar_bloc.dart';

@immutable
sealed class PracticeBlocBarEvent {}

class InitialPracticeBlocBarEvent extends PracticeBlocBarEvent {
  final int tabIndex;
  InitialPracticeBlocBarEvent({required this.tabIndex});
}
