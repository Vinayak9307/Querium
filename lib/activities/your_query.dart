import 'package:flutter/material.dart';

import 'main_feed.dart';

class YourQuery extends StatefulWidget {
  const YourQuery({super.key});

  @override
  State<YourQuery> createState() => _YourQueryState();
}

class _YourQueryState extends State<YourQuery> {
  final List your_query = [
    'your_query 1',
    'your_query 2',
    'your_query 3',
    'your_query 4',
    'your_query 5',
    //'post 6',
    //'post 7',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
          body: ListView.builder(
          itemCount: your_query.length,
          itemBuilder: (context, index){
          return const Post();
        },
      ),
    );
  }
}