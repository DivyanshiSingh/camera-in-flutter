// Using the Camera package

import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get _image => null;

  // final File_image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      var _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Image Picker',
        home: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.yellow,
            title: new Text(
              'Image Picker',
              style: TextStyle(color: Colors.brown),
            ),
          ),
          body: new Center(
            child: _image == null
                ? new Text('No image selected')
                : new Image.file(_image),
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Pick Image',
            child: new Icon(Icons.camera),
          ),
        ));
  }
}
