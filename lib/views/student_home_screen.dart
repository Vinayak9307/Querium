import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/utils/post_card.dart';
import 'package:querium/views/drawer.dart';
import 'package:querium/views/main_feed.dart';
import 'package:querium/providers/user_provider.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  //This method uses the user provider to load the user data
  //when the user comes to the home screen
  loadUserData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  final List post = [
    'post 1',
    'post 2',
    'post 3',
    'post 4',
    'post 5',
    //'post 6',
    //'post 7',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        title: const Text('Feed',textAlign: TextAlign.center, style:TextStyle(fontWeight: FontWeight.w600) ),
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: post.length,
          itemBuilder: (context, index) {
            return const PostCardView();
          },
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              MyDrawer(), 
            ],
          ),
        ),
      ),
    );
  }
}
