import 'package:flutter/foundation.dart';
import 'package:app/Place.dart';
import 'dart:io';
import 'DBHelper.dart';


class  GreatPlaces with ChangeNotifier{
  List<Place> itemS=[];

  List<Place> get items{
 return [...itemS];

  }
  void addPlace(String pickedtitle,File pickedimage){
    final newPlace =  Place(id: DateTime.now().toString(),image: pickedimage,title: pickedtitle,location: );


    itemS.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', { 'id':newPlace.id, 'title':newPlace.title,'image':newPlace.image.path});
  }

}