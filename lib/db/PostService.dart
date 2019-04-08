import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_firebase_crudoperayion/models/Post.dart';


class PostService{

  String nodename="posts";

  FirebaseDatabase database=FirebaseDatabase.instance;
  DatabaseReference _databaseReference;

  Map post;

  PostService(this.post);

  addPost(){
    _databaseReference=database.reference().child(nodename);
    _databaseReference.push().set(post);
  }

}
