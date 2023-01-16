import 'package:flutter/material.dart';
import 'package:app/ImageInput.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:app/GreatPlaces.dart';
import 'package:provider/provider.dart';




class AddPlacesScreen extends StatefulWidget {
  static const routeName = '/add-screen';

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();


}

class _AddPlacesScreenState extends State<AddPlacesScreen> {

  final titleController = TextEditingController();

  File? pickedIMAGE;
  void selectImage (File pickedImage) {
      pickedIMAGE = pickedIMAGE;
  }

  void savedPlace(){
    if(titleController.text.isEmpty|| pickedIMAGE ==null){
      return;
    }
    Provider.of<GreatPlaces>(context,listen: false).addPlace(titleController.text,pickedIMAGE!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          'Add A New Place',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 21,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                      controller: titleController,
                    ),
                    ImageInput(selectImage),
                    SizedBox(height: 10,),
                    Container(), TextButton(onPressed:(){},child: Text(''),)
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.add_circle_outlined,
              color: Colors.purple,
              size: 25.3,
            ),
            label: Text(
              'Add Place',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 21,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            onPressed: savedPlace,

          ),
        ],
      ),
    );
  }
}
