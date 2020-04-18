import 'package:flutter/material.dart';

import 'my_bottom_sheet.dart';
import 'note_card.dart';
import 'note_model.dart';
import 'notes_collection.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MyBottomSheet(),
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 512),
          child: Padding(
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
                }),
          ),
        ),
      ),
    );
  }
}
