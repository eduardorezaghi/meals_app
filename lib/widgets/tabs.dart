import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({
    super.key,
    required this.pages,
  });

  final List<Widget> pages;

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  Widget get _currentTab => widget.pages[_currentIndex];
  Widget _currentTitle = const Text('Categories');

  @override
  Widget build(BuildContext context) {
    switch (_currentIndex) {
      case 1:
        _currentTitle = const Text('Favorites');
        break;
      case 2:
        _currentTitle = const Text('Profile');
        break;
      default:
        _currentTitle = const Text('Categories');
        break;
    }

    void _setScreen(String identifier) {
      Navigator.of(context).pop();
      switch (identifier) {
        case 'filters':
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FiltersScreen(
                onSave: () {},
              ),
            ),
          );
          break;
        default:
          // Close the drawer on any other navigation
          Navigator.of(context).pop();
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: _currentTitle,
      ),
      drawer: MainDrawer(onNavigate: (identifier) => _setScreen(identifier)),
      body: _currentTab,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
