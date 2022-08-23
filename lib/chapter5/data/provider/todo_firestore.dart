import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../todo.dart';

class TodoFirebase {
  late CollectionReference _todosReference; // collection 'todos' reference
  late Stream<QuerySnapshot> _todoStream; // stream of todos

  Stream<QuerySnapshot> get todoStream => _todoStream;

  Future initDb() async {
    _todosReference = FirebaseFirestore.instance.collection('todos');
    _todoStream = _todosReference.snapshots();
  }

  List<Todo> getTodos(AsyncSnapshot<QuerySnapshot> snapshot) =>
      snapshot.data!.docs
          .map((DocumentSnapshot document) => Todo.fromSnapshot(document))
          .toList();

  Future addTodo(Todo todo) async => _todosReference.add(todo.toMap());

  Future updateTodo(Todo todo) async => todo.reference?.update(todo.toMap());

  Future deleteTodo(Todo todo) async => todo.reference?.delete();
}
