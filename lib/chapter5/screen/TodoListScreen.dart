import 'dart:async';

import 'package:Flutter_Study/chapter5/data/provider/todo_firestore.dart';
import 'package:Flutter_Study/chapter5/data/provider/todo_sqlite.dart';
import 'package:Flutter_Study/chapter5/data/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];
  TodoSqlite todoSqlite = TodoSqlite();
  TodoFirebase todoFirebase = TodoFirebase();

  bool isLoading = true;

  Future<List<Todo>?> initDb() async {
    try {
      await todoSqlite.initDb();
      todos = await todoSqlite.getTodos();
      return todos;
    } catch (e) {
      return null;
    }
  }

  initFirestore() async {
    try {
      await todoFirebase.initDb();
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // initDb().then((value) => {
    //       setState(() {
    //         isLoading = false;
    //       })
    //     });
    setState(() {
      initFirestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: todoFirebase.todoStream,
        builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            todos = todoFirebase.getTodos(snapshot);
            return Scaffold(
                appBar: AppBar(
                  title: Text('Todo List'),
                  actions: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.book),
                            Text('news'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () => fabAction(context),
                ),
                body: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                              title: Text(todos[index].title),
                              onTap: () => showDetail(context, index),
                              trailing: Container(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: InkWell(
                                        child: Icon(Icons.edit),
                                        onTap: () => showEdit(context, index),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: InkWell(
                                        child: Icon(Icons.delete),
                                        onTap: () => showDelete(context, index),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: todos.length));
          }
        }));
  }

  void fabAction(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          String title = '';
          String descripntion = '';
          return AlertDialog(
            title: Text('할 일 추가하기'),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      title = value;
                    },
                    decoration: InputDecoration(labelText: '제목'),
                  ),
                  TextField(
                    onChanged: (value) {
                      descripntion = value;
                    },
                    decoration: InputDecoration(labelText: '설명'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Todo newTodo = Todo(title: title, description: descripntion);
                  todoFirebase
                      .addTodo(newTodo)
                      .then((value) => Navigator.of(context).pop());
                },
                child: Text('추가'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('취소'))
            ],
          );
        });
  }

  void showDetail(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('할 일'),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text('제목 : ${todos[index].title}'),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('설명 : ${todos[index].description}'),
          )
        ],
      ),
    );
  }

  void showEdit(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        String title = todos[index].title;
        String description = todos[index].description;

        return AlertDialog(
          title: Text('할 일 수정하기'),
          content: Container(
            height: 200,
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    title = value;
                  },
                  decoration: InputDecoration(hintText: todos[index].title),
                ),
                TextField(
                  onChanged: (value) {
                    description = value;
                  },
                  decoration:
                      InputDecoration(hintText: todos[index].description),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Todo newTodo = Todo(
                      title: title,
                      description: description,
                      reference: todos[index].reference);
                  todoFirebase
                      .updateTodo(newTodo)
                      .then((value) => Navigator.of(context).pop());
                },
                child: Text('수정')),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            )
          ],
        );
      },
    );
  }

  void showDelete(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('할 일 삭제하기'),
              content: Container(
                child: Text('삭제하시겠습니까?'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      todoFirebase
                          .deleteTodo(todos[index])
                          .then((value) => Navigator.of(context).pop());
                    },
                    child: Text('삭제')),
                TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: Text('취소')),
              ],
            ));
  }
}
