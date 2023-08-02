part of 'album_bloc.dart';

@immutable
abstract class AlbumEvent {}

@immutable
class FetchAlbumsEvent extends AlbumEvent {}
