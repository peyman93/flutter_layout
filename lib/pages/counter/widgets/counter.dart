import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.counter});

  final int counter;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _carCount = 0;

  @override
  void initState() {
    print('initState');
    _carCount = widget.counter;
    super.initState();
  }

  @override
  void didUpdateWidget(Counter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('###didUpdateWidget');
    print('###${oldWidget.counter}');
    print('###${widget.counter}');
    _carCount = oldWidget.counter;
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => setState(() {
            print('setState');
            _carCount++;
          }),
        ),
        Text(_carCount.toString()),
      ],
    );
  }
}
