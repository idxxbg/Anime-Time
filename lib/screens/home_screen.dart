import 'package:anime_world_tutorial/screens/anime_categories_screen.dart';
import 'package:anime_world_tutorial/screens/anime_screen.dart';
import 'package:anime_world_tutorial/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.index});
  final int? index;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    if (widget.index != null) {
      _selectedIndex = widget.index!;
    }
    super.initState();
  }

  int _selectedIndex = 0;
  final destinations = [
    const NavigationDestination(icon: Icon(Icons.home), label: "home"),
    const NavigationDestination(icon: Icon(Icons.search), label: "search"),
    const NavigationDestination(icon: Icon(Icons.category), label: "category"),
    const NavigationDestination(icon: Icon(Icons.settings), label: "settings"),
  ];

  final _screen = const [
    AnimeScreen(),
    SearchScreen(),
    AnimeCategoriesScreen(),
    Center(child: Text('settings_Sc')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 30,
        selectedIndex: _selectedIndex,
        destinations: destinations,
        onDestinationSelected: (index) {
          HapticFeedback.lightImpact();
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
