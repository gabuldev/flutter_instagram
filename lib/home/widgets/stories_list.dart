import 'package:flutter/material.dart';

class StoriesList extends StatefulWidget {
  @override
  _StoriesListState createState() => _StoriesListState();
}

class _StoriesListState extends State<StoriesList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context,index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
          ),
        ),
      )
     
    );
  }
}