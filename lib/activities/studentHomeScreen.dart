import 'package:flutter/material.dart';
import 'package:querium/activities/main_feed.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
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
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: post.length,
        itemBuilder: (context, index) {
          return const Post();
        },
      ),
    );
  }
}
