import 'package:cloud_firestore/cloud_firestore.dart';

class NotesCollection {
  CollectionReference _notes = Firestore.instance.collection('notes');

  Stream<List<NoteModel>> getNotes() {
    return _notes.snapshots().map(noteModelFromQuerySnapshot);
  }

  List<NoteModel> noteModelFromQuerySnapshot(QuerySnapshot qs) {
    return qs.documents.map(noteModelFromDocSnapShot).toList();
  }

  NoteModel noteModelFromDocSnapShot(DocumentSnapshot dss) {
    return NoteModel.fromDocSnapShot(dss);
  }

  removeNote(String docId) {
    _notes.document(docId).delete();
  }

  void addNotes(NoteModel note) {
    _notes.add({
      'title': note.title,
      'desc': note.description,
    });
  }
}

class NoteModel {
  String title, description, docId;
  NoteModel.fromDocSnapShot(DocumentSnapshot dss) {
    title = dss.data['title'];
    description = dss.data['desc'];
    docId = dss.documentID;
  }

  NoteModel({this.title, this.description});
}
