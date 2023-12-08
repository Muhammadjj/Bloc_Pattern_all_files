import 'package:bloc_pattern_in_flutter/Screens/Practice/bloc/practice_bloc_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// List Of Items Data .
List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.grid_3x3),
    label: 'Category',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search_outlined),
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    label: 'Favorite',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    label: 'Cart',
  ),
];

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  // ! List of Body .
  List<Widget> listOfData = [
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.blueGrey,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint("Bloc");
    return BlocBuilder<PracticeBlocBarBloc, PracticeBlocBarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Bottom Navigation Bar"),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            currentIndex: state.tabIndex,
            onTap: (index) {
              BlocProvider.of<PracticeBlocBarBloc>(context)
                  .add(InitialPracticeBlocBarEvent(tabIndex: index));
            },
          ),
          body: listOfData.elementAt(state.tabIndex),
        );
      },
    );
  }
}
