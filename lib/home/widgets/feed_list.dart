import 'dart:io';

import 'package:flutter/material.dart';

class FeedList extends StatefulWidget {
  final File file;
  final Stream fileOut;
  const FeedList({Key key, this.file, this.fileOut}) : super(key: key);
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  Widget build(BuildContext context) {

     Size size = MediaQuery.of(context).size;
  
  feedTile() => Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(" nome"),
              leading: CircleAvatar(),
              trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: (){},),
            ),
            StreamBuilder<String>(
              stream: widget.fileOut ,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                 return Container(
                    width: size.width,
                    height: 200,
                    child: Image.file(File(snapshot.data),fit: BoxFit.cover,),
                  );
                }
                else{
                  return Container(
                    width: size.width,
                    height: 200,
                    color: Colors.red,
                  );
                }
              }
            ),
           /* Container(
              height: 200,
              color: Colors.red,
              width: size.width,
              child: widget.file != null ? Image.file(widget.file,fit: BoxFit.cover,) : Container(),
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  IconButton(icon: Icon(Icons.more), onPressed: (){},),
                  IconButton(icon: Icon(Icons.send), onPressed: (){},),
                  IconButton(icon: Icon(Icons.send), onPressed: (){},),
                ],),
                IconButton(icon: Icon(Icons.send), onPressed: (){},),
              ],
            )
          ],
        ),
      ),
  );

   
    return Column(
      children: [1,2,3,4,5,6,7,8,9,10].map((i) => feedTile()).toList(),
    );
  }
}