// This class is used as the user model class
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? uid;
  String? username;
  String? email;
  String? regNo;
  String? roomNo;
  String? hostel;
  int? complaintFiled = 0;
  int? solvedComplaints = 0;

  User({
    this.uid,
    this.username,
    this.email,
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
      regNo: map['regNo'],
      roomNo: map['roomNo'],
      hostel: map['hostel'],
      complaintFiled: map['complaintFiled'],
      solvedComplaints: map['solvedComplaints'],
    );
  }
}
