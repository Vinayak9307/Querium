import 'package:flutter/material.dart';
import 'package:querium/views/main_feed.dart';
import 'package:querium/utils/global_colors.dart';

class SolvedComplaints extends StatefulWidget {
  const SolvedComplaints({super.key});

  @override
  State<SolvedComplaints> createState() => _SolvedComplaintsState();
}

class _SolvedComplaintsState extends State<SolvedComplaints> {
  final List solved_complaints = [
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
        
        title: const Text('Solved Complaints',textAlign: TextAlign.center, ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
        backgroundColor: Colors.white,
          body: ListView.builder(
          itemCount: solved_complaints.length,
          itemBuilder: (context, index){
          return const Post();
        },
      ),
    );
    
  }
}