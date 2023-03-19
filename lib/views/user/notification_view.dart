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
  final List noti = [
    'post 1',
    'post 2',
    'post 3',
    'post 4',
    'post 5',
  ];
  Widget tiles() {
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
              boxShadow: const [
                // BoxShadow(
                //   //color: Color.fromARGB(255, 211, 223, 243),
                //   offset: Offset(4.0, 4.0),
                //   blurRadius: 10,
                //   spreadRadius: 0.5,
                // ),
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 5,
                    spreadRadius: 0.5),
              ]),
          child: const ListTile(
              enabled: false,

              //tileColor: const Color.fromARGB(255, 211, 223, 243),
              title: Text(
                'this is title',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              subtitle: Text('this is discription',
                  style: TextStyle(color: Colors.black))),
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
          itemCount: noti.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  const SizedBox(
                    height: 13,
                  ),
                  const Text('slide right to delete '),
                  const SizedBox(
                    height: 9,
                  ),
                  tiles(),
                ],
              );
            }
            return tiles();
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
