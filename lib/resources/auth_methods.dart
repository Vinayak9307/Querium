import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:querium/models/user.dart' as model;
import 'package:querium/providers/user_provider.dart';

import '../models/admin.dart';

class AuthMethods {
  //Instance of firebase authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.getUser(snapshot);
  }

  Future<Admin> getAdminDetails() async {
    User currentAdmin = _auth.currentUser!;

    DocumentSnapshot snapshot =
        await _firestore.collection('admin').doc(currentAdmin.uid).get();

    return Admin.getAdmin(snapshot);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String regNo,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          regNo.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        model.User user = model.User(
          username: username,
          email: email,
          uid: cred.user!.uid,
          regNo: regNo,
          hostel: "",
          roomNo: "",
          complaintFiled: "0",
          solvedComplaints: "0",
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.getData());
      }
      res = "Sign Up Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> signUpAdmin({
    required String email,
    required String password,
    required String username,
    required String category,
    required String level,
  }) async {
    String res = "Some error occured";
    try {
      DocumentReference ref =
          _firestore.collection('allowedAdmins').doc('allowedAdminsList');
      DocumentSnapshot snap = await ref.get();

      Map<String, dynamic> map = snap.data() as Map<String, dynamic>;
      var authorisedAdmins = map['list'];

      //This flag is used to check weather the admin is present in authorised admins or not
      bool isPresent = false;
      for (String s in authorisedAdmins) {
        if (s == email) isPresent = true;
      }
      if (isPresent) {
        if (email.isNotEmpty ||
            password.isNotEmpty ||
            username.isNotEmpty ||
            category.isNotEmpty ||
            level.isNotEmpty) {
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);

          Admin admin = Admin(
              username: username,
              category: category,
              email: email,
              uid: cred.user!.uid,
              level: level);

          await _firestore
              .collection('admin')
              .doc(cred.user!.uid)
              .set(admin.getData());
        }
        res = "Sign Up Success";
      } else {
        res = "You are not authorised to Sign up";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some Error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "Log In Success";
      } else {
        res = "Enter email and password";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> logoutUser() async {
    String res = "Some Error Occured";
    try {
      await _auth.signOut();
      res = "Log Out Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> changeState(
      String key, String value, Map<String, dynamic> userMap) async {
    String res = "Some Error Occured";
    try {
      userMap[key] = value;
      await _firestore.collection('users').doc(userMap['uid']).set(userMap);
      res = "Update Success";
    } catch (err) {
      res = err.toString();
    }
    print(res);
    return res;
  }

  Future<String> changeAdminState(
      String key, String value, Map<String, dynamic> userMap) async {
    String res = "Some Error Occured";
    try {
      userMap[key] = value;
      await _firestore.collection('admin').doc(userMap['uid']).set(userMap);
      res = "Update Success";
    } catch (err) {
      res = err.toString();
    }

    print(res);
    return res;
  }

  Future<String> changeComplaintState(
      String key, dynamic value, Map<String, dynamic> userMap) async {
    String res = "Some Error Occured";
    try {
      userMap[key] = value;
      await _firestore
          .collection('complaints')
          .doc(userMap['compId'])
          .set(userMap);
      res = "Update Success";
    } catch (err) {
      res = err.toString();
    }
    print(res);
    return res;
  }
}
