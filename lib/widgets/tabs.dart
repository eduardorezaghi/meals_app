import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: _currentTitle,
      ),
      body: _currentTab,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
