import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/resources/auth_methods.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/utils/utils.dart';
import 'package:querium/views/onboarding.dart';
import 'package:querium/models/user.dart' as model;

import '../../providers/user_provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String? name;
  String? regNo;
  String? email;
  String? profileURL;

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

  //this overrides the state of hostel name or Room no when user edits it
  @override
  void initState() {
    super.initState();
    model.User user = Provider.of<UserProvider>(context, listen: false).getUser;
    Map<String, dynamic> userMap = user.getData();
    name = userMap['username'];
    regNo = userMap['regNo'];
    email = userMap['email'];
    profileURL = userMap['profileURL'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: GlobalColor.mainColor,
          width: double.infinity,
          height: 250,
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(31, 57, 106, 158),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(profileURL!),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                name!,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                regNo!,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                email!,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ListTile(
          leading: const Icon(
            Icons.person_2_outlined,
            size: 20,
          ),
          title: const Text(
            'About us',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            size: 20,
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(fontSize: 20),
          ),
          onTap: logOutUser,
        ),
      ],
    );
  }
}
