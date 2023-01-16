import 'package:flutter/material.dart';
import 'package:app/AddPlacesScreen.dart';
import 'package:provider/provider.dart';
import 'package:app/GreatPlaces.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Places',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 21,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddPlacesScreen.routeName,
              );
            },
            icon: Icon(
              Icons.add_circle_outline_sharp,
              color: Colors.purple,
              size: 25.3,
            ),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Text(
            'Got no places yet,Start adding some!',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 21,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
        ),
        builder: (ctx, greatPlaces, chILd) => greatPlaces.itemS.length <= 0
            ? chILd!
            : ListView.builder(
                itemCount: greatPlaces.itemS.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatPlaces.itemS[index].image,
                    ),
                  ),
                  title: Text(greatPlaces.itemS[index].title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
