import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:querium/activities/your_query.dart';
import 'package:querium/models/user.dart' as model;
import 'package:querium/providers/user_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final mydecoration = BoxDecoration(
      color: Colors.deepPurple.shade200,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.deepPurple.shade500,
          offset: const Offset(4.0, 4.0),
          blurRadius: 15,
          spreadRadius: 1.0,
        ),
        const BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15,
            spreadRadius: 1.0),
      ]);
  @override
  Widget build(BuildContext context) {
    //User object is being initialised with the data from the provider
    model.User user = Provider.of<UserProvider>(context, listen: false).getUser;

    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile_pic.png"),
              ),
              SizedBox(
                height: 46,
                width: 46,
                child: TextButton(
                  child: SvgPicture.asset("assets/images/camera icon.png"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            decoration: mydecoration,
            child: Text(
              // ignore: prefer_interpolation_to_compose_strings
              '    ' + user.getData()['username'],
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            decoration: mydecoration,
            child: const Text(
              '    ' + '2022CA067',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            decoration: mydecoration,
            child: Text(
              // ignore: prefer_interpolation_to_compose_strings
              '    ' + user.getData()['email'],
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            decoration: mydecoration,
            child: const Text(
              '    ' + '335',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 150,
        ),
        SizedBox(
          height: 60,
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const YourQuery()),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                side: BorderSide.none,
                shape: const StadiumBorder()),
            child: const Text(
              'your queries',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
