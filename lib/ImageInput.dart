import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? storedImage;

  Future<void> TakePicture() async {
    final picker = ImagePicker();
    final ImageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 600,
    );
      if(ImageFile==null){
        return;
      }
    setState(() {
      storedImage = File(ImageFile!.path);
    });
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = basename(ImageFile!.path);
    final savedImage =
        await File(ImageFile.path).copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.pink),
          ),
          child: storedImage != null
              ? Image.file(
                  storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            icon: Icon(
              Icons.camera_rounded,
              color: Colors.purple,
              size: 25.3,
            ),
            onPressed: TakePicture,
            label: Text(
              'Take Picture',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 21,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
          ),
        )
      ],
    );
  }
}
