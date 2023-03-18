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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 238, 244),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4.0,4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Color.fromARGB(255, 251, 248, 248),
              offset: Offset(-4.0,-4.0),
              blurRadius: 15,
              spreadRadius: 1.0
            ),
          ]
        ),
      ),
    );
  }
}