import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/providers/user_provider.dart';
import 'package:querium/utils/global_colors.dart';

import '../../models/user.dart';

class QueryComments extends StatefulWidget {
  const QueryComments({super.key, this.snap});
  final snap;
  @override
  State<QueryComments> createState() => _QueryCommentsState();
}

class _QueryCommentsState extends State<QueryComments> {
  var snap;
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    snap = widget.snap;

    List filedata = snap['comments'];
  }

  List filedata = [
    {
      'name': 'Prashant',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Tunde Martins',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              title: Text(
                data[i]['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: Text(
                data[i]['message'],
              ),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Comment Page"),
          centerTitle: true,
          backgroundColor: GlobalColor.mainColor,
        ),
        body: Container(
          child: CommentBox(
            child: commentChild(filedata),
            //userImage: const AssetImage('./assets/images/color.jpg'),
            labelText: 'Write a comment...',
            errorText: 'Comment cannot be blank',
            withBorder: false,
            sendButtonMethod: () {
              if (formKey.currentState!.validate()) {
                print(commentController.text);
                setState(() {
                  var value = {
                    'name': user.username,
                    'message': commentController.text,
                    'date': DateTime.now().toString(),
                  };
                  filedata.insert(0, value);
                });
                commentController.clear();
                FocusScope.of(context).unfocus();
              } else {
                print("Not validated");
              }
            },
            formKey: formKey,
            commentController: commentController,
            backgroundColor: GlobalColor.mainColor,
            textColor: Colors.white,
            sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
          ),
        ));
  }
}
