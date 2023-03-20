import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/resources/auth_methods.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/utils/utils.dart';
import 'package:querium/views/about_page_view.dart';
import 'package:querium/views/onboarding.dart';
import 'package:querium/models/user.dart' as model;

import '../../models/admin.dart';
import '../../providers/admin_provider.dart';
import '../../providers/user_provider.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({super.key});

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  String? name;
  String? category;
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
    Admin admin = Provider.of<AdminProvider>(context, listen: false).getAdmin;
    Map<String, dynamic> userMap = admin.getData();
    name = userMap['username'];
    profileURL = userMap['profileURL'];
    email = userMap['email'];
    category = userMap['category'];
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
              SizedBox(
                child: profileURL != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(profileURL!),
                      )
                    : const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/index.png"),
                      ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 10),
              //   height: 100,
              //   width: 100,
              //   decoration: const BoxDecoration(
              //     color: Color.fromARGB(31, 57, 106, 158),
              //     shape: BoxShape.circle,
              //     image: DecorationImage(
              //       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/querium-40901.appspot.com/o/profilePic%2Fkgh87sQ6E2OlxbOiEzit1Bad5Mk1?alt=media&token=f8bad6d6-b15c-47eb-ad8f-72baee46e051"),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 5,
              ),
              Text(
                name!,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                category!,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                email!,
                style: const TextStyle(color: Colors.white, fontSize: 15),
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutPageView()),
            );
          },
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
