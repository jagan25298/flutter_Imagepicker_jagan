import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _imageFile == null ?Text('No Image selected'): Image.file(_imageFile!),
              ElevatedButton(
                  onPressed: () {
                    print('image pick from gallery button clicked');
                    _imageFrom(ImageSource.gallery);
                  },
                  child: Text('Image pick from gallery')),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    print('image pick from camera button clicked');
                    _imageFrom(ImageSource.camera);
                  },
                  child: Text('Image pick from Camera')),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _imageFrom(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path);
        } else {
          print('No image clicked');
        }
      });
    } catch (e) {
      print('error image picked');
    }
  }
}
