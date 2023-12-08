// ignore_for_file: must_be_immutable

import 'package:bloc_pattern_in_flutter/Screens/Bloc_Pattern_Using_Package_Bottom_Navigation_Bar/Business_Logic/bloc/landing_page_bottom_navigation_bloc.dart';
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

class LandingPageBloc extends StatelessWidget {
  LandingPageBloc({super.key});

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
    return BlocConsumer<LandingPageBottomNavigationBloc,
        LandingPageBottomNavigationState>(
      listener: (context, state) {},
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
              BlocProvider.of<LandingPageBottomNavigationBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
          body: listOfData[state.tabIndex],
        );
      },
    );
  }
}
