import 'package:flutter/material.dart';
import 'package:flutter_notes/home/widgets/note_card.dart';
import 'package:flutter_notes/database/notes_collection.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: buildBottomSheet(),
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<List<NoteModel>>(
              stream: NotesCollection().getNotes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<NoteModel> notes = snapshot.data;
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: notes.length,
                    itemBuilder: (_, i) {
                      return Dismissible(
                        onDismissed: (_) {
                          NotesCollection().removeNote(notes[i].docId);
                        },
                        key: Key(notes[i].docId),
                        child: NoteCard(notes[i]),
                      );
                    },
                  );
                } else
                  return Container();
              })),
    );
  }

  Container buildBottomSheet() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _title,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: _description,
            decoration: InputDecoration(hintText: 'Description'),
          ),
          SizedBox(height: 16),
          RaisedButton(
            color: Colors.deepPurple,
            shape: StadiumBorder(),
            onPressed: () {
              String title = _title.text;
              String desc = _description.text;
              NotesCollection().addNotes(
                NoteModel(
                  title: title,
                  description: desc,
                ),
              );
            },
            child: Text(
              'Add Note',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildAddCard() {
    return Container(
      height: 128,
      decoration: BoxDecoration(
        border: Border.all(width: 4),
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 48, vertical: 8),
      child: Center(
        child: Icon(Icons.add_circle),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  final Function addNote;

  MyFloatingActionButton(this.addNote);

  String title, desc;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      child: Icon(Icons.add),
      onPressed: () {
        Scaffold.of(context).showBottomSheet(
          (_) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Title'),
                  onChanged: (value) => title = value,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Description'),
                  onChanged: (value) => desc = value,
                ),
                RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: () {
                    Navigator.of(context).pop();
                    addNote(title, desc);
                  },
                  child: Text(
                    'Add Note',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
