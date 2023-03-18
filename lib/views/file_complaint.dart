import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:querium/utils/utils.dart';
import 'package:querium/views/widgets/button_global.dart';
import 'package:querium/views/widgets/text_field_global.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/drop_down_items.dart';
import '../utils/global_colors.dart';

String? selectedCategory = '';
String? title = '';
String? description = '';
final formKey = GlobalKey<FormState>();

class FileComplaint extends StatefulWidget {
  const FileComplaint({super.key});

  

  @override
  State<FileComplaint> createState() => _FileComplaintState();
}

class _FileComplaintState extends State<FileComplaint> {
  final TextEditingController controller = TextEditingController();


  String imageUrl = '';
  final List<Uint8List> _imgList = [];
  int _counter = 0;
  void showImage() async{
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
      onTap: () => {
        FocusScope.of(context).requestFocus(FocusNode())
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: GlobalColor.mainColor,
            elevation: 0,
            centerTitle: true,
            title: const Text(
            "File a Complaint",
            style : TextStyle(
              fontSize: 32,
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
                  children:  [
                    const SizedBox(height: 35,),
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
                    const SizedBox(height: 15,),
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
                      validator: (value) => value == null
                      ? "Please select a category"
                      : null,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      "Title",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8,),
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
                    const SizedBox(height: 20,),
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
                    const SizedBox(height: 15,),
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
                    const SizedBox(height: 20,),
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
                    const SizedBox(height: 20,),
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
                        const SizedBox(width: 30,),
                        Column(
                          children: [
                            _imgList.isNotEmpty ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_imgList[0]),):Container(),
                          ],
                              ),
                          ],
                        ),
                    const SizedBox(height: 50,),
                    ButtonGlobal(
                      text: "Submit",
                      onTap: () async {

                        if (formKey.currentState!.validate()) {
                          // String itemName = _controllerName.text;
                          // String itemQuantity = _controllerQuantity.text;

                          //Create a Map of data
                          Map<String, String> dataToSend = {
                            // 'name': itemName,
                            // 'quantity': itemQuantity,
                            'image': imageUrl,
                          };

                          //Add a new item
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),);
  }
}

class ImageShow extends StatelessWidget {
  final String name;
  final void Function()? delete;
  const ImageShow({super.key, required this.name, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (3.5 * MediaQuery.of(context).size.width) / 6,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.only(left: 5.0),
      color: Colors.grey[300],
      child: Row(
        children: <Widget>[
          const Icon(Icons.image),
          const SizedBox(
            width: 3.0,
          ),
          Text(name),
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.only(right: 2.0),
            onPressed: delete,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

