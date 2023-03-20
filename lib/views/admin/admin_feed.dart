import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/providers/admin_provider.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/utils/post_card.dart';
import 'package:querium/views/user/drawer.dart';

import '../../models/admin.dart';
import 'admin_drawer.dart';

class AdminFeedView extends StatefulWidget {
  const AdminFeedView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminFeedViewState createState() => _AdminFeedViewState();
}

class _AdminFeedViewState extends State<AdminFeedView> {

  int colIndex = 0;
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  //This method uses the user provider to load the user data
  //when the user comes to the home screen
  loadUserData() async {
    AdminProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshAdmin();
  }

  @override
  Widget build(BuildContext context) {
    Admin admin = Provider.of<AdminProvider>(context).getAdmin;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        title: const Text(
          'Feed',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('complaints').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                if (snapshot.data!.docs[index].data()['category'] ==
                    admin.category && snapshot.data!.docs[index].data()['level'] == admin.level ) {
                  return PostCardView(
                    snap: snapshot.data!.docs[index].data(),
                    user: admin,
                  );
                } else {
                  return Container();
                }
              });
        },
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              AdminDrawer(),
            ],
          ),
        ),
      ),
    );
  }
}
