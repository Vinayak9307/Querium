import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/views/file_complaint.dart';
import 'package:querium/views/onboarding.dart';

import 'nav_bar.dart';

// ignore: camel_case_types
class splashView extends StatefulWidget {
  const splashView({super.key});

  @override
  State<splashView> createState() => _splashViewState();
}

// ignore: camel_case_types
class _splashViewState extends State<splashView> {
  @override
  void initState() {
    super.initState();
    Widget next = StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const NavBar();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
        return const OnBoarding();
      },
    );
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => next,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Timer(const Duration(seconds: 2), () {Get.to(LoginView()); });
    return SafeArea(
        child: Scaffold(
      backgroundColor: GlobalColor.mainColor,
      body: const Center(
        child: Text(
          "Querium",
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
