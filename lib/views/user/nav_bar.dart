import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:querium/views/admin/admin_feed.dart';
import 'package:querium/views/admin/admin_profile.dart';
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
  // final Widget _stuHomeScreen = const StudentHomeScreen();
  // final Widget _fileComplaint = const FileComplaint();
  // final Widget _profile = const Profile();
  // final Widget _notification = const notificationView();
  // final Widget _adminFeed = const AdminFeedView();
  // final Widget _adminProfile = const AdminProfile();
  bool isLoading = false;

  List<Widget>? screensUser;
  List<Widget>? screensAdmin;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    setState(() {
      print(user.runtimeType);
      screensUser = [
        const StudentHomeScreen(),
        const FileComplaint(),
        const Profile(),
        const notificationView(),
      ];
      screensAdmin = [
        const AdminFeedView(),
        const AdminProfile(),
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
    if (isLoading) {
      
    }
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('admin')
            .doc(user!.uid)
            .get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> user) {
          if(user.connectionState == ConnectionState.waiting){
            return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(),
          ));
          }
          return user.data!.exists == false
              ? Scaffold(
                  body: screensUser![_selectedIndex],
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
                      Icon(Icons.notification_important_outlined,
                          color: Colors.white)
                    ],
                  ),
                )
              : Scaffold(
                  body: screensAdmin![_selectedIndex],
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
                  ),
                );
        });
  }
}
