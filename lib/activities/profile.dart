import 'package:flutter/material.dart';
import 'profile_body.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          'Profile',
          style: TextStyle(
            color: Color.fromARGB(255, 147, 141, 141),
          ),
        )),
      ),
      body: const Body(),
    );
  }
}
