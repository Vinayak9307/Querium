import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:querium/views/profile.dart';
import 'package:querium/views/student_home_screen.dart';
import 'package:querium/views/file_complaint.dart';
import 'package:querium/views/home_page_view.dart';

import '../utils/global_colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final Widget _stuHomeScreen = const StudentHomeScreen();
  final Widget _fileComplaint = const FileComplaint();
  final Widget _profile = const Profile();
  final Widget _notification = const HomePage();

  List<Widget>? screens;

  @override
  void initState() {
    super.initState();
    setState(() {
      screens = [
        _stuHomeScreen,
        _fileComplaint,
        _profile,
        _notification,
      ];
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens![_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: GlobalColor.mainColor,
        animationDuration: const Duration(milliseconds: 300),
        onTap: _onItemTapped,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.add, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.notification_important_outlined, color: Colors.white)
        ],
      ),
    );
  }
}
