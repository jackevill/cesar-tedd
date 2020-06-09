import 'package:cesar_tdd/views/todo_view.dart';
import 'package:flutter/material.dart';

class TodoListModel extends ChangeNotifier {
  final _todos = List<Todo>();

  List<Todo> get todos => List.unmodifiable(_todos);

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(int position) {
    _todos.removeAt(position);
    notifyListeners();
  }
}
