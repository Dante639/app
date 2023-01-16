import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/GreatPlaces.dart';
import 'package:app/PlacesListScreen.dart';
import 'package:app/AddPlacesScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {GreatPlaces();},
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          primaryColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlacesScreen.routeName:(ctx)=>AddPlacesScreen(),
        },
      ),
    );
  }
}
