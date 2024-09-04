import 'package:flutter/material.dart';

class TodosList extends StatelessWidget {
  const TodosList({
    required this.todos,
    required this.onDelete,
    super.key,
  });

  final List<String> todos;
  final void Function(int) onDelete;

  @override
  Widget build(BuildContext context) => todos.isEmpty
      ? const Center(child: Text('No item'))
      : ListView.separated(
          itemCount: todos.length,
          itemBuilder: _itemBuilder,
          separatorBuilder: (_, __) => const Divider(),
        );

  Widget _itemBuilder(_, int index) => Row(
        children: [
          Expanded(child: Text(todos[index])),
          IconButton(
            onPressed: () => onDelete(index),
            icon: const Icon(Icons.clear),
          )
        ],
      );
}
