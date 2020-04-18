import 'package:flutter/material.dart';

import 'note_model.dart';
import 'notes_collection.dart';

class MyBottomSheet extends StatelessWidget {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
}
