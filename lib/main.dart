import 'package:cesar_tdd/models/todo_list_model.dart';
import 'package:cesar_tdd/views/create_todo_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green,
      primaryColorDark: Colors.green[700],
      primaryColorLight: Colors.lightGreen[200],
      accentColor: Colors.deepOrangeAccent
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text('Cesar TDD'),
      ),
      body: TodoList(TodoListModel()),
    ),
  ));
}

class TodoList extends StatelessWidget {
  final TodoListModel _model;

  TodoList(this._model);

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<TodoListModel>.value(
        value: _model,
        child: Stack(
          children: <Widget>[
            Consumer<TodoListModel>(
              builder: (consumerCtx, model, child) => ListView.builder(
                itemCount: model.todos.length,
                itemBuilder: (listContext, position) => Dismissible(
                  onDismissed: (direction) {
                    model.removeTodo(position);
                  },
                  key: UniqueKey(),
                  child: model.todos[position],
                ),
              ),
            ),
            Positioned(
              right: 36,
              bottom: 36,
              child: FloatingActionButton(
                tooltip: 'Create todo',
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionsBuilder:
                          (transitionContext, animationA, animationB, child) {
                        final slideUp = animationA.drive(
                          Tween(begin: Offset(0.0, 1.0), end: Offset.zero),
                        );

                        return SlideTransition(position: slideUp, child: child);
                      },
                      pageBuilder: (pageContext, aniamtionA, animationB) =>
                          CreateTodo(
                        (todo) {
                          _model.addTodo(todo);
                        },
                      ),
                    ),
                  );
                },
                child: Icon(Icons.playlist_add),
              ),
            )
          ],
        ),
      );
}
