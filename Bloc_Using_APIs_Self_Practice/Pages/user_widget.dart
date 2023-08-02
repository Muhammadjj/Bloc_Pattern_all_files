import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_APIs_Self_Practice/user_json_class/user_json.dart';
import 'package:flutter/material.dart';

class UserInitialWidget extends StatelessWidget {
  const UserInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("CLICK THIS BELOW BUTTON ."));
  }
}

class UserLoadingWidget extends StatelessWidget {
  const UserLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}

class UserLoadedWidget extends StatelessWidget {
  const UserLoadedWidget({super.key, required this.user});
  final List<UsersJsonParentFiles> user;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.lime,
            collapsedHeight: 200,
            stretch: true,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.blurBackground],
              collapseMode: CollapseMode.parallax,
              background: Image(image: AssetImage("assets/images/api.jpg"),fit: BoxFit.cover,),
            ),
            
          ),

          SliverList.builder(
            itemCount: user.length,
            itemBuilder: (context, index) {
              return Card(
                    elevation: 10,
                    color: Colors.pink.withOpacity(0.5),
                    shadowColor: Colors.grey,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTileWidget(json: user[index]));
            },)
        ],
      )
    );
  }
}

class ListTileWidget extends ListTile {
  final UsersJsonParentFiles json;
  ListTileWidget({super.key, required this.json})
      : super(
            leading: Text(json.id.toString()),
            title: Text(json.name.toString()),
            subtitle: Text(json.email.toString()),
            trailing: Text(json.address!.city.toString()));
}

class UserErrorMessage extends StatelessWidget {
  const UserErrorMessage({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return  Center(child: Text(error.toString()));
  }
}




// ** Simple Coding Without Sliver(CustomScrollViewi)
///Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: user.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return Card(
      //               elevation: 8,
      //               color: Colors.pink.withOpacity(0.5),
      //               shadowColor: Colors.grey,
      //               shape: BeveledRectangleBorder(
      //                   borderRadius: BorderRadius.circular(5)),
      //               child: ListTileWidget(json: user[index]));
      //         },
      //       ),
      //     ),
      //   ],
      // ),