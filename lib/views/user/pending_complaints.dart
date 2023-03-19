import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/providers/user_provider.dart';
import 'package:querium/utils/global_colors.dart';

import '../../models/user.dart';
import '../../utils/post_card.dart';

class PendingComplaints extends StatefulWidget {
  const PendingComplaints({super.key});

  @override
  State<PendingComplaints> createState() => _PendingComplaintsState();
}

class _PendingComplaintsState extends State<PendingComplaints> {
  final List pending_complaints = [
    'your_query 1',
    'your_query 2',
    'your_query 3',
    'your_query 4',
    'your_query 5',
  ];
  @override
  Widget build(BuildContext context) {
        User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        title: const Text(
          'Pending Complaints',
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
                if(snapshot.data!.docs[index].data()['uid'] == user.uid && snapshot.data!.docs[index].data()['status'] == "pending"){
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
