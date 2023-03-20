import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/providers/user_provider.dart';
import 'package:querium/views/user/notification_view.dart';
import 'package:querium/views/user/profile.dart';
import 'package:querium/views/user/student_home_screen.dart';

import '../../utils/global_colors.dart';
import 'file_complaint.dart';

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
  final Widget _notification = const notificationView();
  bool isLoading = true;

  List<Widget>? screens;
  User? user = FirebaseAuth.instance.currentUser;

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
    loadUserData();
  }

  loadUserData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
    setState(() {
      isLoading = false;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(),
          ));
    }
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
