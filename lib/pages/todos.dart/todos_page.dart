import 'package:flutter/material.dart';

import '../../component/my_list.dart';
import 'widgets/todo_creator.dart';

class TotodsPage extends StatefulWidget {
  const TotodsPage({super.key});

  @override
  State<TotodsPage> createState() => _TotodsPageState();
}

class _TotodsPageState extends State<TotodsPage> {
  final todos = <String>[];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _body(),
      );

  Widget _body() => Column(
        children: [
          _todoCreator(),
          Expanded(child: _todoList()),
        ],
      );

  // TodosList _todoList() => TodosList(
  //       todos: todos,
  //       onDelete: (index) => setState(() => todos.removeAt(index)),
  // );

  Widget _todoList() => MyList<String, BacheMamad>(
        list2: [BacheMamad('name')],
        onDelete: (_) {},
        list: todos,
        itemBuilder: (_, __, ___) => const Text('example'),
      );

  Widget _todoCreator() => TodoCreator(
        onSubmit: (value) => setState(() => todos.add(value)),
      );
}

class Person {
  const Person(this.name);

  final String name;
}

class Mamad extends Person {
  Mamad(super.name);
}

class Sasan extends Person {
  Sasan(super.name);
}

class BacheMamad extends Mamad {
  BacheMamad(super.name);
}
