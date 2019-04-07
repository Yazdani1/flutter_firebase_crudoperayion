import 'package:flutter/material.dart';
import 'addPostdata.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Flutter CRUD Using Firebase"),
        backgroundColor: Colors.redAccent,
      ),

      body: new Container(
        margin: EdgeInsets.all(10.0),
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        child: new Card(
          elevation: 10.0,
         child: new Container(
           padding: EdgeInsets.all(10.0),
           child: new Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[

               new Text("Title",
                 style: TextStyle(fontSize: 21.0,color: Colors.orange),
                 maxLines: 1,
               ),
               new SizedBox(height: 10.0,),
               new Text("Description",
                 style: TextStyle(fontSize: 17.0,color: Colors.black),
                 maxLines: 2,
               )

             ],
           ),
         ),
        ),

      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>addPost()));
          },
        
        child: new Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.purple,
        tooltip: ("Add data"),
        elevation: 10.0,
      ),


    );
  }
}

