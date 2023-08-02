part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

@immutable
class AlbumInitial extends AlbumState {}

@immutable
class AlbumLoadingStates extends AlbumState {}

@immutable
class AlbumLoadedState extends AlbumState {
  final List<Album> albums;
  AlbumLoadedState({required this.albums});
}

@immutable
class AlbumErrorStates extends AlbumState {
  final String errorMessage;
  AlbumErrorStates({required this.errorMessage});
}
