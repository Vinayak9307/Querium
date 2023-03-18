import 'package:flutter/material.dart';
import 'package:querium/resources/auth_methods.dart';
import 'package:querium/views/onboarding.dart';
import 'package:querium/views/widgets/button_global.dart';

import '../utils/global_colors.dart';
import '../utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logOutUser() async {
    String res = await AuthMethods().logoutUser();
    if (res != "Log Out Success") {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 13,
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
              height: 50,
            ),
            Text(
              "Create your account",
              style: TextStyle(
                color: GlobalColor.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //Email Box

            const SizedBox(
              height: 60,
            ),
            ButtonGlobal(
              text: "Sign Out",
              onTap: logOutUser,
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
