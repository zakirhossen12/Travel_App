import 'package:flutter/material.dart';
import 'category.dart'; // Import your other pages as needed

class BottomNavBar extends StatefulWidget {
  final int currentIndex;

  BottomNavBar({required this.currentIndex});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CategoryPage()),
        );
        break;
      // Add cases for other items as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.green),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: Colors.green),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money, color: Colors.green),
          label: 'Money',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.green),
          label: 'Search',
        ),
      ],
    );
  }
}
