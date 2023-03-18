import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/providers/user_provider.dart';
import 'package:querium/resources/firestore_methods.dart';
import 'package:querium/views/widgets/button_global.dart';
import 'package:uuid/uuid.dart';

import '../models/complaint.dart';
import '../models/user.dart' as model;

class AddComplaint extends StatefulWidget {
  const AddComplaint({super.key});

  @override
  State<AddComplaint> createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = false;
  model.User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hello');
    setState(() {
      user = Provider.of<UserProvider>(context, listen: false).getUser;
    });
    print('hi');
  }

  void addComplaint() async {
    setState(() {
      isLoading = true;
    });
    String compId = const Uuid().v1();

    String res = await FirestoreMethods().uploadComplaint(
      complaint: Complaint(
          uid: user!.getData()['uid'],
          compId: compId,
          email: user!.getData()['email'],
          regNo: user!.getData()['regNo'],
          hostel: user!.getData()['hostel'],
          roomNo: user!.getData()['roomNo'],
          title: "Dummy Complaint",
          category: "Dummy",
          description: "Dummy",
          filingTime: DateTime.now(),
          images: [],
          name: user!.getData()['username'],
          status: ComplaintStatus.pending.name,
          upvotes: []),
      images: [
        Uint8List(1024),
      ],
    );

    setState(() {
      isLoading = false;
    });
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ButtonGlobal(
          text: "Add",
          onTap: addComplaint,
          isLoading: isLoading,
        ),
      ),
    );
  }
}
