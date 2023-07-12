import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:image_picker/image_picker.dart';

class PickUpImageWidget extends StatefulWidget {
  PickUpImageWidget({this.selectedImage, super.key});

  Function({File? image})? selectedImage;

  @override
  _PickUpImageWidgetState createState() => _PickUpImageWidgetState();
}

class _PickUpImageWidgetState extends State<PickUpImageWidget> {
  File? _image;

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        widget.selectedImage!(image: _image);
      }
    });
  }

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        widget.selectedImage!(image: _image);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (_image != null)
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Container(
                  height: AppSize.s150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.file(_image!, fit: BoxFit.cover),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _image = null;
                    widget.selectedImage!(image: null);
                  });
                },
                icon: const CircleAvatar(
                  radius: 22,
                  child: Icon(
                    Icons.close,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ElevatedButton(
          onPressed: _getImageFromGallery,
          child: Text('Pick Image from Gallery'),
        ),
        ElevatedButton(
          onPressed: _getImageFromCamera,
          child: Text('Take a Picture'),
        ),
      ],
    );
  }
}
