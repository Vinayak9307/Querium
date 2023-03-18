import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:querium/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

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
    List<String> upvotes = compMap['upvotes'];
    var status = compMap['status'];

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
          upvotes: upvotes);

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
}
