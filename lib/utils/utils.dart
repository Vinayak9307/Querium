import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//show SnackBar
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

pickImage(ImageSource imageSource) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? xf = await imagePicker.pickImage(source: imageSource);

  if (xf != null) {
    return await xf.readAsBytes();
  }
}
