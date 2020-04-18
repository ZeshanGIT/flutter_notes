import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String title, description, docId;
  NoteModel.fromDocSnapShot(DocumentSnapshot dss) {
    title = dss.data['title'];
    description = dss.data['desc'];
    docId = dss.documentID;
  }

  NoteModel({this.title, this.description});
}
