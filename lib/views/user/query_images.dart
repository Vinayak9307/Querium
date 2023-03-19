import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://i.pinimg.com/originals/78/2f/03/782f032235bd4b00c80de140b8e70538.jpg'),
          fit: BoxFit.fill,
        ),
        //shape: BoxShape.circle,
      ),
      ),
    );
  }
}