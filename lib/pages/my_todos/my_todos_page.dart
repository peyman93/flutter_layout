import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_layout/pages/add_todo/add_todo.dart';
import 'package:http/http.dart' as http;

import '../shared/api_state.dart';
import 'widgets/my_todo_list.dart';

class MyTodosPage extends StatefulWidget {
  const MyTodosPage({super.key});

  @override
  State<MyTodosPage> createState() => _MyTodosPageState();
}

class _MyTodosPageState extends State<MyTodosPage> {
  final _todos = <String>[];
  ApiState _state = ApiState.loading;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _state == ApiState.loading
            ? const Center(child: CircularProgressIndicator())
            : MyTodoList(todos: _todos),
        floatingActionButton: _floating(context),
      );

  FloatingActionButton _floating(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _onAddTodo(context),
      child: const Icon(Icons.add),
    );
  }

  void _onAddTodo(BuildContext context) async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (_) => const AddTodoPage()),
    );

    if (result ?? false) {
      _fetchData();
    }
  }

  void _fetchData() async {
    setState(() => _state = ApiState.loading);

    final response = await http.get(Uri.parse("http://127.0.0.1:3000/todos"));

    final data = jsonDecode(response.body);

    _todos.clear();

    for (final item in (data as List)) {
      _todos.add(item['value'] as String);
    }

    setState(() => _state = ApiState.success);
  }
}
