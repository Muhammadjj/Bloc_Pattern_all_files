import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_Apis_Class_Code/album.dart';
import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_Apis_Class_Code/api_provider_method.dart';
import 'package:meta/meta.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final albumApiProvider = AlbumApiProvider();
  AlbumBloc() : super(AlbumInitial()) {
    on<FetchAlbumsEvent>((event, emit) async {
      emit(AlbumLoadingStates());
      try {
        var albums = await albumApiProvider.fetchAlbums();
        emit(AlbumLoadedState(albums: albums));
      } catch (e) {
        emit(AlbumErrorStates(errorMessage: e.toString()));
      }
    });
  }
}
