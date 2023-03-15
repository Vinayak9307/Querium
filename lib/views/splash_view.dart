import 'dart:async';

import 'package:flutter/material.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/views/onboarding.dart';

// ignore: camel_case_types
class splashView extends StatefulWidget {
  const splashView({super.key});

  @override
  State<splashView> createState() => _splashViewState();
}

// ignore: camel_case_types
class _splashViewState extends State<splashView> {
  @override
  void initState(){
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OnBoarding(),
              )
            )
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
      )
    );
  }
}
