import 'package:Flutter_Study/chapter5/data/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoSqlite {
  late Database _db;
  static const String _todoTable = "MyTodo";

  Future initDb() async {
    _db = await openDatabase(join(await getDatabasesPath(), 'my_db.db'),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS $_todoTable (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT)',
      );
    }, version: 1);
  }

  Future<List<Todo>> getTodos() async {
    List<Todo> todos = [];
    List<Map> maps =
        await _db.query(_todoTable, columns: ['id', 'title', 'description']);
    maps.forEach((element) {
      todos.add(Todo.fromMap(element));
    });
    return todos;
  }

  Future<Todo?> getTodo(int id) async {
    List<Map> map = await _db.query(_todoTable,
        columns: ['id', 'title', 'description'],
        where: 'id = ?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return Todo.fromMap(map[0]);
    }
  }

  Future addTodo(Todo todo) async {
    int id = await _db.insert(_todoTable, todo.toMap());
  }

  Future deleteTodo(int id) async {
    await _db.delete(_todoTable, where: 'id = ?', whereArgs: [id]);
  }

  Future updateTodo(Todo todo) async {
    await _db.update(_todoTable, todo.toMap(),
        where: 'id = ?', whereArgs: [todo.id]);
  }
}
