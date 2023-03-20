import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:querium/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';
import 'package:querium/models/notifications.dart' as model;

import '../models/complaint.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Future<String> uploadComplaint(
      {required Complaint complaint, required List<Uint8List> images}) async {
    String res = "Some error occured";
    Map<String, dynamic> compMap = complaint.getData();
    var uid = compMap['uid'];
    var name = compMap['name'];
    var compId = compMap['compId'];
    var email = compMap['email'];
    var regNo = compMap['regNo'];
    var roomNo = compMap['roomNo'];
    var hostel = compMap['hostel'];
    var title = compMap['title'];
    var category = compMap['category'];
    var description = compMap['description'];
    List<String> imgURL = [];
    var filingTime = compMap['filingTime'];
    var upvotes = compMap['upvotes'];
    var status = compMap['status'];
    var comments = compMap['comments'];
    var adminRes = compMap['adminRes'];
    var level = compMap['level'];

    try {
      for (int i = 0; i < images.length; i++) {
        imgURL.add(await StorageMethods()
            .uploadImageToStorage('complaints', images[i], true, compId));
      }

      Complaint complaint = Complaint(
        uid: uid,
        compId: compId,
        email: email,
        regNo: regNo,
        hostel: hostel,
        roomNo: roomNo,
        title: title,
        category: category,
        description: description,
        filingTime: filingTime,
        images: imgURL,
        name: name,
        status: status,
        upvotes: upvotes,
        comments: comments,
        adminRes: adminRes,
        level: level
      );

      await _firestore
          .collection('complaints')
          .doc(compId)
          .set(complaint.getData());

      res = "Upload Success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
  Future<String> uploadNotification(
      {required model.Notification notification}) async {
    String res = "Some error occured";
    Map<String, dynamic> compMap = notification.getData();
    var uid = compMap['uid'];
    var email = compMap['email'];
    var title = compMap['title'];
    var message = compMap['message'];

      model.Notification notification1 = model.Notification(
        uid: uid,
        email: email,
        title: title,
        message: message,
      );
    try {

      await _firestore
          .collection('notifications')
          .doc(uid)
          .set(notification1.getData());

      res = "Upload Success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
