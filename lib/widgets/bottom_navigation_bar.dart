import 'package:flutter/material.dart';
import 'package:news_app_figma/constants/colors.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColor().primary,
        unselectedItemColor: Colors.blue,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(Icons.favorite_border_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.face),
          ),
        ],
      ),
    );
  }
}
