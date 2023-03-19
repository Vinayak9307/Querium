import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/providers/user_provider.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/utils/post_card.dart';

import '../../models/user.dart';


class SolvedComplaints extends StatefulWidget {
  const SolvedComplaints({super.key});

  @override
  State<SolvedComplaints> createState() => _SolvedComplaintsState();
}

class _SolvedComplaintsState extends State<SolvedComplaints> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        title: const Text(
          'Solved Complaints',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('complaints').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                if(snapshot.data!.docs[index].data()['uid'] == user.uid && snapshot.data!.docs[index].data()['status'] == "solved"){
                  return PostCardView(
                    snap: snapshot.data!.docs[index].data(),
                  );
                }
              });
          },
      ),
    );
  }
}
