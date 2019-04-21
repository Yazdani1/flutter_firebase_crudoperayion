import 'package:flutter/material.dart';
import 'package:flutter_firebase_crudoperayion/db/PostService.dart';
import 'package:flutter_firebase_crudoperayion/models/Post.dart';
import 'HomePage.dart';


class addPost extends StatefulWidget {
  @override
  _addPostState createState() => new _addPostState();
}

class _addPostState extends State<addPost> {

  final GlobalKey<FormState>formkey = new GlobalKey();

  Post post=new Post(0, " ", " ");


  @override
  Widget build(BuildContext context) {



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
                    onSaved: (val)=>post.title=val,
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
                      onSaved: (val)=>post.body=val,
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
          onPressed: (){
            insertPost();
            Navigator.of(context).pop();
            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Home()));
          },
        child: new Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.green,
      ),
    );
  }
  void insertPost(){
    final FormState formState=formkey.currentState;
    if(formState.validate()){
      formState.save();
      formState.reset();
      post.date=DateTime.now().millisecondsSinceEpoch;
      PostService postService=new PostService(post.toMap());
      postService.addPost();
    }
  }
}

