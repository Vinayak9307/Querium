import 'package:flutter/material.dart';
import 'package:querium/utils/global_colors.dart';

import 'main_feed.dart';

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
      body: ListView.builder(
        itemCount: pending_complaints.length,
        itemBuilder: (context, index) {
          return const Post();
        },
      ),
    );
  }
}
