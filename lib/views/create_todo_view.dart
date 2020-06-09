import 'package:cesar_tdd/views/todo_view.dart';
import 'package:flutter/material.dart';

class CreateTodo extends StatelessWidget {
  final void Function(Todo todo) _onCreateTodo;
  CreateTodo(this._onCreateTodo);

  @override
  Widget build(BuildContext context) {
    String _title;
    String _summary;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Title'),
                  onChanged: (input) => _title = input,
                ),
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(hintText: 'Summary'),
                  onChanged: (input) => _summary = input,
                )
              ],
            ),
            FlatButton(
              onPressed: () {
                if(_title.isNotEmpty && _summary.isNotEmpty) {
                  final todo = Todo(_title, _summary);
                  _onCreateTodo(todo);
                  Navigator.of(context).pop(this);
                }
              },
              child: Text('CREATE TODO'),
            )
          ],
        ),
      ),
    );
  }
}
