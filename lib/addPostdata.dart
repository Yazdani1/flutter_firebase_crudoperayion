import 'package:flutter/material.dart';


class addPost extends StatefulWidget {
  @override
  _addPostState createState() => new _addPostState();
}

class _addPostState extends State<addPost> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Add Your Post"),
        backgroundColor: Colors.green,
      ),

    );
  }
}

