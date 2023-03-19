import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:querium/utils/utils.dart';
import 'package:querium/views/drawer.dart';
import 'package:querium/views/widgets/button_global.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../models/complaint.dart';
import '../models/user.dart' as model;
import '../providers/user_provider.dart';
import '../resources/firestore_methods.dart';
import '../utils/drop_down_items.dart';
import '../utils/global_colors.dart';

class FileComplaint extends StatefulWidget {
  const FileComplaint({super.key});

  @override
  State<FileComplaint> createState() => _FileComplaintState();
}

class _FileComplaintState extends State<FileComplaint> {
  //Form variables
  String? selectedCategory = '';
  String? title = '';
  String? description = '';
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  bool isLoading = false;
  model.User? user;
  String imageUrl = '';
  final List<Uint8List> _imgList = [];
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      user = Provider.of<UserProvider>(context, listen: false).getUser;
    });
  }

  void addComplaint() async {
    setState(() {
      isLoading = true;
    });
    String compId = const Uuid().v1();

    String res = await FirestoreMethods().uploadComplaint(
      complaint: Complaint(
          uid: user!.getData()['uid'],
          compId: compId,
          email: user!.getData()['email'],
          regNo: user!.getData()['regNo'],
          hostel: user!.getData()['hostel'],
          roomNo: user!.getData()['roomNo'],
          title: title!,
          category: selectedCategory!,
          description: description!,
          filingTime: DateTime.now(),
          images: [],
          name: user!.getData()['username'],
          status: ComplaintStatus.pending.name,
          upvotes: []),
      images: _imgList,
    );
    print(res);
    setState(() {
      isLoading = false;
    });
  }

  void showImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _imgList.add(im);
      _counter++;
      print(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusScope.of(context).requestFocus(FocusNode())},
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalColor.mainColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "File a Complaint",
            style: TextStyle(
              //fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "Choose the category ?",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "You can choose only one category",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 109, 107, 107),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    items: categories,
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
                    //width: MediaQuery.of(context).size.width*0.91,
                    validator: (value) =>
                        value == null ? "Please select a category" : null,
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Title",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    minLines: 1,
                    maxLines: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Title can't be left empty.";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Add title",
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
                      focusedBorder: OutlineInputBorder(
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
                      contentPadding: const EdgeInsets.only(top: 13, left: 8),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Add details",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Details you think is important for us to know",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 109, 107, 107),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    minLines: 1,
                    maxLines: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Description can't be left empty.";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Add description",
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
                      focusedBorder: OutlineInputBorder(
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
                      contentPadding: const EdgeInsets.only(top: 13, left: 8),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Add photos",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Photos helps us to find best staff and tools for your needs as soon as possible",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 109, 107, 107),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Color.fromRGBO(127, 128, 128, 1),
                          size: 40.0,
                        ),
                        color: Colors.blue,
                        onPressed: showImage,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          _imgList.isNotEmpty
                              ? CircleAvatar(
                                  radius: 64,
                                  backgroundImage: MemoryImage(_imgList[0]),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonGlobal(
                    text: "Submit",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        addComplaint();
                      }
                    },
                    isLoading: isLoading,
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
      child: SingleChildScrollView(
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
}

