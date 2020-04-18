import 'package:flutter/material.dart';
import 'note_model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel noteModel;
  const NoteCard(this.noteModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            noteModel.title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            noteModel.description,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
