import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:tv24africa/widgets/cameraButyonWidget.dart';
import 'package:tv24africa/widgets/galleryButton.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFbd1017),
        title: Text("Sellect mediaSource"),
      ),
      body: ListView(
        children: [
          CameraButtonWidget(),
          GalleryButtonWidget(),
        ],
      ),
      
    );
  }
}