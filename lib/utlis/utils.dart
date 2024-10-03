import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// we are defining a function pickImage, which gets the image from the user and stores as bytes.
pickImage(ImageSource source)async{
  final ImagePicker _imagePicker = ImagePicker();
//Xfile is a file type that is returned by imagepicker function.
  XFile? _file = await _imagePicker.pickImage(source: source);

  if(_file != null){
    return await _file.readAsBytes();
  }
  print('No image selected');
}