// This class is used as the user model class
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  String? uid;
  String? username;
  String? profileURL;
  String? email;
  String? category;

  Admin({
    this.uid,
    this.username,
    this.email,
    this.profileURL,
    this.category,
  });

  //This function returns a map of data related to the user object
  Map<String, dynamic> getData() => {
        "uid": uid,
        "username": username,
        "email": email,
        "profileURL": profileURL,
        "category": category,
      };

  //This method returns a user instance based on the document snapshot given by firebase authentication
  static Admin getAdmin(DocumentSnapshot snap) {
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return Admin(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      profileURL: map['profileURL'],
      category: map['category'],
    );
  }
}
