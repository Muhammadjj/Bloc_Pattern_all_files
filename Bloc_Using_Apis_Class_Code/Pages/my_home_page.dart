import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/album_bloc.dart';
import 'album_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocConsumer<AlbumBloc, AlbumState>(
        listener: (context, state) {
          if (state is AlbumLoadedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Congratulation Data Fetch ."),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              dismissDirection: DismissDirection.horizontal,
            ));
          }
        },
        builder: (context, state) {
          if (state is AlbumInitial) {
            return const AlbumInitialWidget();
          } 
          else if (state is AlbumLoadingStates) {
            return const AlbumLoadingWidget();
          } 
          else if (state is AlbumLoadedState) {
            return AlbumLoadedWidget(albums: state.albums,);
          } else {
            return AlbumErrorWidget(
                errorMessage: (state as AlbumErrorStates).errorMessage);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AlbumBloc>().add(FetchAlbumsEvent());
        },
        tooltip: 'FetchAlbumsEvent',
        child: const Icon(
          Icons.face_retouching_natural,
          color: Colors.amber,
        ),
      ),
    );
  }
}



/**
 * switch (state) {
          AlbumInitial => const AlbumInitialWidget(),
          AlbumLoading => const AlbumLoadingWidget(),
          AlbumLoaded =>
            AlbumLoadedWidget(albums: (state as AlbumLoaded).albums),
          _ =>
            AlbumErrorWidget(errorMessage: (state as AlbumError).errorMessage)
        }
 * 
 */