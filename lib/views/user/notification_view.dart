import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:querium/views/user/drawer.dart';

import '../../utils/global_colors.dart';

// ignore: camel_case_types
class notificationView extends StatefulWidget {
  const notificationView({super.key});

  @override
  State<notificationView> createState() => _notificationViewState();
}

// ignore: camel_case_types
class _notificationViewState extends State<notificationView> {
  final List titlemsg= [
    'Responded !!',
    'Fowarded..',
    'UpVote ',
    
  ];
  final List message = [
    'Admin responded to your problem.',
    'Your problem has been forwarded by admin',
    'Your problem received an upvote',
    
  ];
  Widget tiles(index) {
    return Slidable(
      startActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: ((context) {}),
          backgroundColor: GlobalColor.mainColor,
          icon: Icons.delete_outline,
        )
      ]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 13, top: 10, bottom: 10, right: 13),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 211, 223, 243),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                ),
              ]),
          child:ListTile(
              enabled: false,

              //tileColor: const Color.fromARGB(255, 211, 223, 243),
              title: Text(
                titlemsg[index],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              subtitle: Text(message[index],
                  style: const TextStyle(color: Colors.black))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        title: const Text(
          'Notifications',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: titlemsg.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('slide right to delete '),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const Icon(Icons.swipe_right),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  tiles(index),
                ],
              );
            }
            return tiles(index);
          }),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              MyDrawer(),
            ],
          ),
        ),
      ),
    );
  }
}
