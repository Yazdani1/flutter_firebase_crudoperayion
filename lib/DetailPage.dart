import 'package:flutter/material.dart';
import 'package:flutter_firebase_crudoperayion/db/PostService.dart';
import 'package:flutter_firebase_crudoperayion/models/Post.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'HomePage.dart';


class DetailPage extends StatefulWidget {

  final Post post;

  DetailPage(this.post);

  @override
  _DetailPageState createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text(widget.post.title),
      ),

      body: new Container(
        child: new ListView(
          children: <Widget>[

            new Container(
              margin: EdgeInsets.all(10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  new Container(
                    child: new Text(
                      timeago.format(DateTime.fromMillisecondsSinceEpoch(widget.post.date))
                    ),
                  ),
                  new IconButton(
                      icon: new Icon(Icons.delete),
                      onPressed: (){
                        PostService postservice=new PostService(widget.post.toMap());
                        postservice.deletepost();

                        Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>Home()));

                      }),
                  new IconButton(
                      icon: new Icon(Icons.edit),
                      onPressed: (){

                      }),


                ],
              ),
            ),//end first container..

            new Container(
              margin: EdgeInsets.all(10.0),
              height: 300.0,
              child: new Card(
                elevation: 10.0,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: new Text(widget.post.body,
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                  ),
                ),
              ),
            )

          ],
        ),
      ),


    );
  }
}
