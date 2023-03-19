import 'package:flutter/material.dart';
import 'package:querium/resources/auth_methods.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/utils/utils.dart';
import 'package:querium/views/onboarding.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
    return Column(
      children: [
        Container(
          color: GlobalColor.mainColor,
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image:  DecorationImage(image: AssetImage("assets/images/index.png"))
                ),
              ),
              const Text('Prashant' , style: TextStyle(color: Colors.white),),
              const Text('2022CA067',style: TextStyle(color: Colors.white),),
              
              
            ],
            
          ),
        ),
        const SizedBox(height:30),
        ListTile(
            leading: const Icon(Icons.person_2_outlined ,size: 20,),
            title: const Text('About us' ,style: TextStyle(fontSize: 20),),
            onTap: () {},
          ),
        ListTile(
            leading: const Icon(Icons.logout,size: 20,),
            title: const Text('Log Out' ,style: TextStyle(fontSize: 20),),
            onTap: logOutUser,
          ),
      ],
    );
  }
}