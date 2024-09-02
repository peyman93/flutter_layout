import 'package:flutter/material.dart';

import '../home/home.dart';
import 'widgets/counter.dart';
import 'widgets/less_counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void dispose() {
    super.dispose();
    print('######################### Dispose');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _body(),
      );

  Widget _body() {
    print('Scaffold rebuild');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Counter(counter: _counter),
          IconButton(
            onPressed: () => setState(() {
              _counter++;
            }),
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}
