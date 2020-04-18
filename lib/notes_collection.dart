import 'package:cloud_firestore/cloud_firestore.dart';
import 'note_model.dart';

class NotesCollection {
  CollectionReference _notes = Firestore.instance.collection('notes');

  //Fetches notes   from Firestore
  Stream<List<NoteModel>> getNotes() {
    return _notes.snapshots().map(noteModelFromQuerySnapshot);
  }

  //Converts QuerySnapshot to List of NoteModel
  List<NoteModel> noteModelFromQuerySnapshot(QuerySnapshot qs) {
    return qs.documents.map(noteModelFromDocSnapShot).toList();
  }

  //Converts DocumentSnapshot to NoteModel
  NoteModel noteModelFromDocSnapShot(DocumentSnapshot dss) {
    return NoteModel.fromDocSnapShot(dss);
  }

  //Removes Note from Firebase
  void removeNote(String docId) {
    _notes.document(docId).delete();
  }

  //Adds Note to Firebase
  void addNotes(NoteModel note) {
    _notes.add({
      'title': note.title,
      'desc': note.description,
    });
  }
}
