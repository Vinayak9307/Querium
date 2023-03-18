import 'package:cloud_firestore/cloud_firestore.dart';

// This class is used as the complaint model class
class Complaint {
  String uid;
  String compId;
  String name;
  String email;
  String regNo;
  String roomNo;
  String hostel;
  String title;
  String category;
  String description;
  List<String> images = [];
  DateTime filingTime;
  List<String> upvotes = [];
  String status;

  Complaint({
    required this.uid,
    required this.compId,
    required this.email,
    required this.regNo,
    required this.hostel,
    required this.roomNo,
    required this.title,
    required this.category,
    required this.description,
    required this.filingTime,
    required this.images,
    required this.name,
    required this.status,
    required this.upvotes,
  });

  //This function returns a map of data related to the user object
  Map<String, dynamic> getData() => {
        'uid': uid,
        'compId': compId,
        'email': email,
        'regNo': regNo,
        'hostel': hostel,
        'roomNo': roomNo,
        'title': title,
        'category': category,
        'description': description,
        'filingTime': filingTime,
        'images': images,
        'name': name,
        'status': status,
        'upvotes': upvotes,
      };

  //This method returns a user instance based on the document snapshot given by firebase authentication
  static Complaint getUser(DocumentSnapshot snap) {
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return Complaint(
      uid: map['uid'],
      compId: map['compId'],
      email: map['email'],
      regNo: map['regNo'],
      hostel: map['hostel'],
      roomNo: map['roomNo'],
      title: map['title'],
      category: map['category'],
      description: map['description'],
      filingTime: map['filingTime'],
      images: map['images'],
      name: map['name'],
      status: map['status'],
      upvotes: map['upvotes'],
    );
  }
}

enum ComplaintStatus {
  pending,
  passed,
  inProgress,
  rejected,
  solved,
}
