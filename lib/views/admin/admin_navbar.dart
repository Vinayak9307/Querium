import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/providers/admin_provider.dart';
import 'package:querium/views/admin/admin_feed.dart';
import '../../utils/global_colors.dart';
import 'admin_profile.dart';

class AdminNavBar extends StatefulWidget {
  const AdminNavBar({super.key});
  @override
  State<AdminNavBar> createState() => _AdminNavBarState();
}

class _AdminNavBarState extends State<AdminNavBar> {
  int _selectedIndex = 0;
  final Widget _adminFeedView = const AdminFeedView();
  final Widget _adminProfile = const AdminProfile();
  bool isLoading = true;

  List<Widget>? screens;

  @override
  void initState() {
    super.initState();
    setState(() {
      screens = [
        _adminFeedView,
        _adminProfile,
      ];
      loadUserData();
    });
  }

  loadUserData() async {
    AdminProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshAdmin();
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
          Icon(Icons.person, color: Colors.white),
        ],
        index: _selectedIndex,
      ),
    );
  }
}