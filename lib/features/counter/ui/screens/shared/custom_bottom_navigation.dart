import 'package:flutter/material.dart';
import 'package:flutter_bloc_akshit/features/counter/ui/screens/bloc_builder_screen.dart';
import 'package:flutter_bloc_akshit/features/counter/ui/screens/bloc_consumer_screen.dart';
import 'package:flutter_bloc_akshit/features/counter/ui/screens/bloc_listener_screen.dart';

import '../home_screen.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: <Widget>[
        /// Home page
        const HomeScreen(),
        const BlocBuilderScreen(),
        const BlocListenerScreen(),
        const BlocConsumerScreen(),
      ][currentPageIndex],
    
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('1'),
              child: Icon(Icons.add_circle_outlined),
            ),
            label: 'BLoC Builder',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.hearing_outlined),
            ),
            label: 'BLoC Listener',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.library_add_outlined),
            ),
            label: 'BLoC Consumer',
          ),
        ],
      ),
    );
  }
}