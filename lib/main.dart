import 'package:flutter/material.dart';
import 'package:threads/screens/activity_screen.dart';
import 'package:threads/screens/compose_screen.dart';
import 'package:threads/screens/home_screen.dart';
import 'package:threads/screens/profile_screen.dart';
import 'package:threads/screens/search_screen.dart';
import 'package:threads/themes/dark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget view = const HomeScreen();
    if (_selectedIndex == 0) {
      view = const HomeScreen();
    } else if (_selectedIndex == 1) {
      view = const SearchScreen();
    } else if (_selectedIndex == 2) {
      view = const ComposeScreen();
    } else if (_selectedIndex == 3) {
      view = const ActivityScreen();
    } else if (_selectedIndex == 4) {
      view = const ProfileScreen();
    }

    return MaterialApp(
      title: 'Threads',
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
      home: Scaffold(
        backgroundColor: const Color(0xFF101010),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color(0xFF101010),
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: const Color(0xFF101010),
              indicatorColor: const Color(0xFF101010),
              shadowColor: const Color(0xFF101010),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((
                Set<MaterialState> states,
              ) {
                return const IconThemeData(
                  color: Colors.white,
                );
              }),
            ),
          ),
          child: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home,
                    color: _selectedIndex == 0
                        ? Colors.white
                        : const Color(0xFF616161)),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search,
                    color: _selectedIndex == 1
                        ? Colors.white
                        : const Color(0xFF616161)),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.edit_square,
                    color: _selectedIndex == 2
                        ? Colors.white
                        : const Color(0xFF616161)),
                label: 'Compose Thread',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border,
                    color: _selectedIndex == 3
                        ? Colors.white
                        : const Color(0xFF616161)),
                label: 'Activity',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_2_outlined,
                    color: _selectedIndex == 4
                        ? Colors.white
                        : const Color(0xFF616161)),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: view,
        ),
      ),
    );
  }
}
