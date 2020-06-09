import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final String _title;
  final String _summary;

  Todo(this._title, this._summary);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(_title),
      leading: Icon(Icons.playlist_add_check),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(_summary),
        )
      ],
    );
  }
}
