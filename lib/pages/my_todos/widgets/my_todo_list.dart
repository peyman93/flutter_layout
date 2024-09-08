import 'package:flutter/material.dart';

class MyTodoList extends StatelessWidget {
  const MyTodoList({required this.todos, super.key});

  final List<String> todos;

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(child: Text('No Item'));
    }

    return ListView.separated(
      itemCount: todos.length,
      itemBuilder: (_, i) => Text(todos[i]),
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
