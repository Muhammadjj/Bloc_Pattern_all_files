import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_Apis_Class_Code/album.dart';
import 'package:flutter/material.dart';


// ** Start this program states
class AlbumInitialWidget extends StatelessWidget {
  const AlbumInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Click Button to Fetch Albums'),
    );
  }
}


// ** When our Apis loading for Network states
class AlbumLoadingWidget extends StatelessWidget {
  const AlbumLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}


// ** Loaded For Network Json Apis
class AlbumLoadedWidget extends StatelessWidget {
  const AlbumLoadedWidget({required this.albums, super.key});
  final List<Album> albums;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => AlbumListTile(album: albums[index]),
    );
  }
}

class AlbumListTile extends ListTile {
  final Album album;
  AlbumListTile({required this.album, super.key})
      : super(
            leading: CircleAvatar(
              child: Text(album.id.toString()),),
            title: Text(album.title.toString()),
            trailing: CircleAvatar(
              child: Text(album.userId.toString()),));
}



// ** Don't Fetch Data and Error Message.
class AlbumErrorWidget extends StatelessWidget {
  const AlbumErrorWidget({required this.errorMessage, super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage,
        style: TextStyle(color: Colors.red.shade900),),);
  }
}
