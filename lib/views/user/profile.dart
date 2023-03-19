import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:querium/views/user/drawer.dart';
import 'package:querium/views/user/pending_complaints.dart';
import 'package:querium/utils/global_colors.dart';
import '../../providers/user_provider.dart';
import '../../resources/auth_methods.dart';
import '../../resources/storage_methods.dart';
import '../../utils/drop_down_items.dart';
import '../../models/user.dart' as model;
import '../../utils/utils.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //these variable gives informaation about the user

  String name = "";
  String regNo = "";
  String hostel = "";
  String roomNo = "";
  String complaintFiled = "";
  String solvedComplaint = "";
  model.User? user;
  String tempHostel = "";
  String tempRoom = "";
  String? profileURL = "";

  //this is a controller for editing the hostel name or Room no
  late TextEditingController controller;

  //this overrides the state of hostel name or Room no when user edits it
  @override
  void initState() {
    super.initState();
    model.User user = Provider.of<UserProvider>(context, listen: false).getUser;
    Map<String, dynamic> userMap = user.getData();
    name = userMap['username'];
    regNo = userMap['regNo'];
    roomNo = userMap['roomNo'];
    hostel = userMap['hostel'];
    complaintFiled = userMap['complaintFiled'];
    solvedComplaint = userMap['solvedComplaints'];
    profileURL = userMap['profileURL'];
    controller = TextEditingController();
    tempHostel = hostel;
    tempRoom = roomNo;
  }

  void onTapPending() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PendingComplaints()),
    );
  }

  void onTapsolved() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PendingComplaints()),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //this is a controller for editing the hostel name or Room no
  late TextEditingController controller1;

  //this overrides the state of hostel name or Room no when user edits it
  @override
  void initState2() {
    super.initState();

    controller1 = TextEditingController();
  }

  @override
  void dispose2() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context, listen: false).getUser;
    Map<String, dynamic> userMap = user.getData();
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        title: const Text('Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              ),
            ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //for spacing
            const SizedBox(
              height: 50,
            ),

            //this stack contains the profile image and its edit option
            Stack(
              children: [
                profileURL != null
                    ? CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(profileURL!),
                      )
                    : const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/images/index.png"),
                      ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: GlobalColor.mainColor),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {
                        uploadImage(userMap);
                      },
                    ),
                  ),
                ),
              ],
            ),
            //for spacing
            const SizedBox(
              height: 20,
            ),
            Text(name,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 20)),
            //for spacing
            const SizedBox(
              height: 5,
            ),
            Text(regNo,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 20)),
            //for spacing
            const SizedBox(
              height: 70,
            ),

            //this row contains the buttons to see complaints filed and complaints resolved
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                complaintsButton(
                    complaintFiled, 'complaints pending', onTapPending, false),
                complaintsButton(
                    solvedComplaint, 'solved complaint', onTapsolved, false),
              ],
            ),
            //for spacing
            const SizedBox(
              height: 30,
            ),

            //this is a card which contains listtile of hostel
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                subtitle: Text(hostel,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                title: const Text(
                  'Hostel',
                ),
                trailing: GestureDetector(
                  child: const Icon(Icons.edit),
                  onTap: () async {
                    await _onEditPressed(1, userMap);
                  },
                ),
              ),
            ),

            //for spacing
            const SizedBox(
              height: 30,
            ),

            //this is a card which contains listtile of hostel
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(
                  Icons.location_on_outlined,
                  size: 30,
                ),
                subtitle: Text(roomNo,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                title: const Text('Room no.'),
                trailing: GestureDetector(
                  child: const Icon(Icons.edit),
                  onTap: () async {
                    await _onEditPressed(2, userMap);
                  },
                ),
              ),
            ),

            const Divider(),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: const [
                MyDrawer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //this method is getting called to display the complaint buttons
  SizedBox complaintsButton(number, text, onTap, isLoading) {
    return SizedBox(
      width: 185,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: GlobalColor.mainColor,
          //minimumSize: MediaQuery.of(context).size.width,
          // minimumSize: const Size.fromHeight(10),
          // maximumSize: const Size.fromHeight(50),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Column(
                children: [
                  Text(number,
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 15)),
                  Text(text,
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 15)),
                ],
              ),
      ),
    );
  }

  //this metthod will be called when user presses the edit icon of hostel name or Room no and it will return a new entry
  Future<String?> _onEditPressed(var flag, var userMap) =>

      //a pop up box would be opened for the user to write the new hostel name or Room no
      showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
                title: flag == 1
                    ? const Text('Hostel name')
                    : const Text('Room No.'),

                //this is the text field for filling the new hostel name or Room no
                content: flag == 1
                    ? DropdownButtonFormField<String>(
                        items: hostelChoice,
                        menuMaxHeight: 200,
                        elevation: 0,
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 159, 158, 158),
                              width: 1.1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 159, 158, 158),
                              width: 1.1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 159, 158, 158),
                              width: 1.1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 159, 158, 158),
                              width: 1.1,
                            ),
                          ),
                        ),
                        onChanged: ((value) {
                          setState(() {
                            tempHostel = value!;
                          });
                        }),
                      )
                    : TextField(
                        autofocus: true,
                        decoration:
                            const InputDecoration(hintText: 'Enter Room No.'),
                        //controller: controller,
                        onChanged: (value) {
                          setState(() {
                            tempRoom = value;
                          });
                        },
                      ),

                //action for submit button of pop up
                actions: [
                  TextButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      submit(userMap);
                    },
                  ),
                ],
              ));

  //this is the submit button for new hostel name or room no.
  //it distroy's the pop up for new hostel name or room no. and returns the new entry
  void submit(var userMap) {
    setState(() {
      hostel = tempHostel;
      roomNo = tempRoom;
    });
    AuthMethods().changeState("hostel", hostel, userMap);
    AuthMethods().changeState("roomNo", roomNo, userMap);
    loadUserData();
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }

  //This method uses the user provider to load the user data
  //when the user comes to the home screen
  loadUserData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  uploadImage(userMap) async {
    Uint8List im = await pickImage(ImageSource.gallery);
    String tempProfileURL = await StorageMethods()
        .uploadImageToStorage("profilePic", im, false, null);
    setState(() {
      profileURL = tempProfileURL;
      AuthMethods().changeState("profileURL", profileURL!, userMap);
    });
  }
}
