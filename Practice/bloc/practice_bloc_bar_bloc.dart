import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'practice_bloc_bar_event.dart';
part 'practice_bloc_bar_state.dart';

class PracticeBlocBarBloc
    extends Bloc<PracticeBlocBarEvent, PracticeBlocBarState> {
  PracticeBlocBarBloc() : super(const PracticeBlocBarState(tabIndex: 0)) {
    on<PracticeBlocBarEvent>((event, emit) {
      if (event is InitialPracticeBlocBarEvent) {
        emit(TabChangeState(tabIndex: event.tabIndex));
      }
    });
  }
}
