import 'package:flutter/material.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/pages/dealerships_page.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/pages/posts_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [DealershipsPage(), PostsListPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Dealerships',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Posts'),
        ],
      ),
    );
  }
}
