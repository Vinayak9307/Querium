import 'package:flutter/material.dart';
import 'package:querium/views/widgets/button_global.dart';
import 'package:querium/utils/global_colors.dart';

import 'login_view.dart';
import 'login_view_admin.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 23,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Querium",
                  style: TextStyle(
                    color: GlobalColor.mainColor,
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/images/onboard.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
                child: const ButtonGlobal(
                  text: "Student",
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginViewAdmin()));
                },
                child: const ButtonGlobal(
                  text: "Administration",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
