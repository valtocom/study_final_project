import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(this.userId, this.id, this.title, this.completed);

  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];
}


Future<List<Todo>> fetchTodos(int userId) async {
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=$userId'));

  return compute(parseTodos, response.body);
}

List<Todo> parseTodos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Todo>((json) => Todo.fromJson(json)).toList();
}