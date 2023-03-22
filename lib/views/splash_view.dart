import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/views/onboarding.dart';
import 'package:querium/views/user/nav_bar.dart';

import 'admin/admin_navbar.dart';

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

    Future.wait([
      getUserData(),
      Future.delayed(
        const Duration(milliseconds: 3000),
      ),
    ]).then((snapshot) {
      String user = (snapshot.first as String);
      Widget next = user == "onBoard"
          ? const OnBoarding()
          : user == "user"
              ? const NavBar()
              : const AdminNavBar();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => next,
        ),
      );
    });
  }

  Future<String> getUserData() async {
    if(FirebaseAuth.instance.currentUser == null) return "onBoard";
    DocumentReference ref = FirebaseFirestore.instance
        .collection('type')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    DocumentSnapshot snap = await ref.get();
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return map['type'];
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

  void waitForLoad(uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).get();
  }
}
