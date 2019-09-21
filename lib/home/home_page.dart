
import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:camera_camera/page/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram/home/home_bloc.dart';
import 'package:instagram/home/widgets/feed_list.dart';
import 'package:instagram/home/widgets/stories_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var current = 0;
  File file;
  List<Widget> pages;

  var bloc = HomeBloc();

  @override
  void initState() {
    pages = [
    Container(
      color: Colors.grey[300],
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          StoriesList(),
          FeedList(fileOut: bloc.photoOut,)
        ],),
      ),
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.orange,
    )
  ];
    super.initState();
  }

  @override
  void dispose() {
   // bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Instagram"),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.camera_alt),
        onPressed: ()async{
           File photo = await Navigator.push(context, MaterialPageRoute(
            builder: (context) => Camera()
          ));
          bloc.photoIn.add(photo.path);
         /* setState(() {
           
             pages = [
    Container(
      color: Colors.grey[300],
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          StoriesList(),
          FeedList(file: photo,)
        ],),
      ),
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.orange,
    )
  ];
          });*/

        },
      ),
      actions: <Widget>[
        IconButton(
        icon: Icon(Icons.send),
        onPressed: (){},
      ),
      ],
    ),
    body: pages[current],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: current,
      onTap: (i){
        setState(() {
         current = i; 
        });
      },
      items: [
        BottomNavigationBarItem(
           icon: Icon(Icons.ac_unit),
          title: Text(" ")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.backspace),
           title: Text(" ")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
           title: Text(" ")
        ),
       
      ],
    ),
    );
  }
}