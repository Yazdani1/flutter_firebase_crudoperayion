import 'package:firebase_database/firebase_database.dart';
class Post{

  static const String KEY="key";
  static const String DATE="date";
  static const String TITLE="title";
  static const String BODY="body";


   int date;
   String key;
   String title;
   String body;

  Post(this.date,this.title, this.body);

  Post.fromSnapshot(DataSnapshot snap):
      this.key=snap.key,
      this.title=snap.value[TITLE],
      this.body=snap.value[BODY],
      this.date=snap.value[DATE];

  Map toMap(){
    return{BODY:body,TITLE:title,DATE:date,KEY:key};
  }

}