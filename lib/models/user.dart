// This class is used as the user model class
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? uid;
  String? username;
  String? profileURL;
  String? email;
  String? regNo;
  String? roomNo;
  String? hostel;
  String? complaintFiled;
  String? solvedComplaints;

  User({
    this.uid,
    this.username,
    this.email,
    this.profileURL,
    this.regNo,
    this.hostel,
    this.roomNo,
    this.complaintFiled,
    this.solvedComplaints,
  });

  //This function returns a map of data related to the user object
  Map<String, dynamic> getData() => {
        "uid": uid,
        "username": username,
        "email": email,
        "profileURL": profileURL,
        "regNo": regNo,
        "roomNo": roomNo,
        "hostel": hostel,
        "complaintFiled": complaintFiled,
        "solvedComplaints": solvedComplaints,
      };

  //This method returns a user instance based on the document snapshot given by firebase authentication
  static User getUser(DocumentSnapshot snap) {
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return User(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      profileURL: map['profileURL'],
      regNo: map['regNo'],
      roomNo: map['roomNo'],
      hostel: map['hostel'],
      complaintFiled: map['complaintFiled'],
      solvedComplaints: map['solvedComplaints'],
    );
  }
}
