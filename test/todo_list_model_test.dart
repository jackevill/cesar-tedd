import 'package:cesar_tdd/models/todo_list_model.dart';
import 'package:cesar_tdd/views/todo_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testes no todo_list_model.dart', () {
    test('A lista de todos deve estar vazia ao instanciar', () {
      final model = TodoListModel();
      expect(model.todos.isEmpty, true);
    });
    test('O conteudo da lista todos deve ser maior ao chamar addTodo()', () {
      final model = TodoListModel();
      final initialLength = model.todos.length;
      model.addTodo(Todo('test', 'test'));
      expect(model.todos.length, greaterThan(initialLength));
    });

    test('O conteudo da lista todos deve ser menor ao chamar removeTodo()', () {
      final model = TodoListModel();
      model.addTodo(Todo('test', 'test'));
      final beforeLength = model.todos.length;
      model.removeTodo(0);
      expect(model.todos.length, lessThan(beforeLength));
    });
  });
}