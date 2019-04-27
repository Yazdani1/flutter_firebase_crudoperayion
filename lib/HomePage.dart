import 'package:flutter/material.dart';
import 'package:flutter_firebase_crudoperayion/models/Post.dart';
import 'addPostdata.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'DetailPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  FirebaseDatabase _database=FirebaseDatabase.instance;

  String nodename="posts";

  //DatabaseReference reference=FirebaseDatabase.instance.reference().child("posts");

  List<Post>postlist=<Post>[];

  @override
  void initState() {
    _database.reference().child(nodename).onChildAdded.listen(_childAdded);
    _database.reference().child(nodename).onChildRemoved.listen(_chidRemove);


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Flutter CRUD Using Firebase"),
        backgroundColor: Colors.redAccent,
      ),

      body: new Container(
            child: FirebaseAnimatedList(
                query: _database.reference().child(nodename),
                reverse: false,
                itemBuilder: (BuildContext context,DataSnapshot snap,Animation<double> animation,int index){
                  return new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new Card(
                      elevation: 10.0,
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(5.0),
                            child: new CircleAvatar(
                              child: new Text(postlist[index].title[0]),
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.white,
                            ),
                          ),
                          new SizedBox(width: 10.0,),
                          new Container(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                new Container(
                                  child: InkWell(
                                    child: new Text(postlist[index].title,
                                      style: TextStyle(fontSize: 20.0,color: Colors.purple),
                                    ),
                                    onTap: (){

                                      Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>DetailPage(postlist[index])));

                                    },
                                  ),

                                ),

                                new SizedBox(height: 5.0,),

                                new Container(
                                  child: new Text(postlist[index].body,
                                    style: TextStyle(fontSize: 16.0,color: Colors.black),
                                  ),
                                ),

                                new SizedBox(height: 5.0,),

                                new Container(
                                  padding: EdgeInsets.only(bottom:5.0),
                                  child: new Text(timeago.format(DateTime.fromMillisecondsSinceEpoch(postlist[index].date)),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.purple
                                  ),
                                  ),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
      ),

      floatingActionButton: new FloatingActionButton(
          onPressed: (){

            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>addPost()));

          },
        
        child: new Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.redAccent,
        tooltip: ("Add data"),
        elevation: 10.0,
      ),

    );
  }

  _childAdded(Event event) {
    setState(() {
      postlist.add(Post.fromSnapshot(event.snapshot));
    });
  }



  void _chidRemove(Event event) {
    var deletePost=postlist.singleWhere((post){
      return post.key==event.snapshot.key;
    });
    setState(() {
      postlist.removeAt(postlist.indexOf(deletePost));
    });
  }



}

