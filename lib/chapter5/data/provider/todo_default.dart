import 'package:Flutter_Study/chapter5/data/todo.dart';

class TodoDefault {
  List<Todo> dummyTodos = [
    Todo(id: 1, title: 'title 1', description: "description 1"),
    Todo(id: 2, title: 'title 2', description: "description 2"),
    Todo(id: 3, title: 'title 3', description: "description 3"),
    Todo(id: 4, title: 'title 4', description: "description 4"),
    Todo(id: 5, title: 'title 5', description: "description 5"),
  ];

  List<Todo> getTodos() {
    return dummyTodos;
  }

  Todo getTodo(int id) {
    return dummyTodos.firstWhere((element) => element.id == id);
  }

  Todo addTodo(Todo todo) {
    Todo newTodo = Todo(
      id: dummyTodos.length + 1,
      title: todo.title,
      description: todo.description,
    );
    dummyTodos.add(newTodo);
    return newTodo;
  }

  void deleteTodo(int id) {
    for (int i = 0; i < dummyTodos.length; i++) {
      if (dummyTodos[i].id == id) {
        dummyTodos.removeAt(i);
      }
    }
  }

  void updateTodo(Todo todo) {
    for (int i = 0; i < dummyTodos.length; i++) {
      if (dummyTodos[i].id == todo.id) {
        dummyTodos[i] = todo;
      }
    }
  }
}
