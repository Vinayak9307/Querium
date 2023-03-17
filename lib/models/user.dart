// This class is used as the user model class
class User {
  String? uid;
  String? username;
  String? email;
  String? regNo;
  String? roomNo;
  String? hostel;

  User({
    this.uid,
    this.username,
    this.email,
    this.regNo,
    this.hostel,
    this.roomNo,
  });

  //This function returns a map of data related to the user object
  Map<String, dynamic> getData() => {
        "uid": uid,
        "username": username,
        "email": email,
        "regNo": regNo,
        "roomNo": roomNo,
        "hostel": hostel,
      };

  User.getUser(Map<String, dynamic> map) {
    uid = map['uid'];
    username = map['username'];
    email = map['email'];
    regNo = map['regNo'];
    roomNo = map['roomNo'];
    hostel = map['hostel'];
  }
}
