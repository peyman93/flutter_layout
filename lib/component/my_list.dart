import 'package:flutter/material.dart';
import 'package:flutter_layout/pages/todos.dart/todos_page.dart';

class MyList<T, S extends Person> extends StatelessWidget {
  const MyList({
    required this.list,
    required this.list2,
    required this.itemBuilder,
    required this.onDelete,
    super.key,
  });

  final List<S> list2;
  final List<T> list;
  final Widget Function(BuildContext context, T item, int index)
      itemBuilder;
  final void Function(T item) onDelete;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => onDelete(list[index]),
          child: itemBuilder(context, list[index], index),
        ),
      );
}
