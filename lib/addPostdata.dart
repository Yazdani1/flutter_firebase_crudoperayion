import 'package:flutter/material.dart';


class addPost extends StatefulWidget {
  @override
  _addPostState createState() => new _addPostState();
}

class _addPostState extends State<addPost> {
  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState>formkey;

    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Add Your Post"),
        backgroundColor: Colors.green,
      ),

      body: new Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
            key: formkey,
            child: new Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new TextFormField(
                    decoration: InputDecoration(
                        labelText: "Title",
                      border: OutlineInputBorder()
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return "Add Your Title";
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new TextFormField(
                      decoration: InputDecoration(
                          labelText: "Description",
                        border: OutlineInputBorder(),

                      ),
                      validator: (val){
                        if(val.isEmpty){
                          return "Add Your Description";
                        }
                      },
                    ),
                ),

              ],
            )
        ),
      ),

      floatingActionButton: new FloatingActionButton(
          onPressed: null,
        child: new Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.green,
      ),

    );
  }
}

