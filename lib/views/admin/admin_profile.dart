import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:querium/models/admin.dart';
import 'package:querium/providers/admin_provider.dart';
import 'package:querium/views/admin/admin_drawer.dart';
import 'package:querium/views/user/drawer.dart';
import 'package:querium/views/user/pending_complaints.dart';
import 'package:querium/utils/global_colors.dart';
import '../../providers/user_provider.dart';
import '../../resources/auth_methods.dart';
import '../../resources/storage_methods.dart';
import '../../utils/drop_down_items.dart';
import '../../models/user.dart' as model;
import '../../utils/utils.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  //these variable gives informaation about the user

  String name = "";
  String? profileURL;
  String category = "";

  //this is a controller for editing the hostel name or Room no
  //late TextEditingController controller;

  //this overrides the state of hostel name or Room no when user edits it
  @override
  void initState() {
    super.initState();
    Admin admin = Provider.of<AdminProvider>(context, listen: false).getAdmin;
    Map<String, dynamic> userMap = admin.getData();
    name = userMap['username'];
    profileURL = userMap['profileURL'];
    category = userMap['category'];
  }

  @override
  Widget build(BuildContext context) {
    Admin admin = Provider.of<AdminProvider>(context, listen: false).getAdmin;
    Map<String, dynamic> userMap = admin.getData();
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
            Text(category,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 20)),
            // Text(regNo,
            //     style: TextStyle(
            //         fontFamily: GoogleFonts.poppins().fontFamily,
            //         fontSize: 20)),
            //for spacing
            const SizedBox(
              height: 70,
            ),

            //this row contains the buttons to see complaints filed and complaints resolved//for spacing
            const SizedBox(
              height: 30,
            ),


            //for spacing
            const SizedBox(
              height: 30,
            ),

            //this is a card which contains listtile of hostel

            const Divider(),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: const [
                AdminDrawer(),
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

  //This method uses the user provider to load the user data
  //when the user comes to the home screen
  loadUserData() async {
    AdminProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshAdmin();
  }

  uploadImage(userMap) async {
    Uint8List im = await pickImage(ImageSource.gallery);
    String tempProfileURL = await StorageMethods()
        .uploadImageToStorage("profilePic", im, false, null);
    setState(() {
      profileURL = tempProfileURL;
      AuthMethods().changeAdminState("profileURL", profileURL!, userMap);
    });
  }
}
