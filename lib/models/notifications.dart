// This class is used as the user model class
import 'package:cloud_firestore/cloud_firestore.dart';

class Notification{
  String? uid;
  String? email;
  String? title;
  String? message;

  Notification({
    this.uid,
    this.email,
    this.title,
    this.message
  });

  //This function returns a map of data related to the user object
  Map<String, dynamic> getData() => {
        "uid": uid,
        "email": email,
        "title":title,
        "message":message,
      };

  //This method returns a user instance based on the document snapshot given by firebase authentication
  static Notification getUser(DocumentSnapshot snap) {
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return Notification(
      uid: map['uid'],
      email: map['email'],
      title: map['title'],
      message: map['message'],
    );
  }
}
