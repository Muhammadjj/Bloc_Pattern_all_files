part of 'practice_bloc_bar_bloc.dart';

// @immutable
class PracticeBlocBarState {
  final int tabIndex;
  const PracticeBlocBarState({required this.tabIndex});
}

final class TabChangeState extends PracticeBlocBarState {
  TabChangeState({required super.tabIndex});
}
