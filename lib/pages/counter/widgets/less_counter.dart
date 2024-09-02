import 'package:flutter/material.dart';

class LessCounter extends StatelessWidget {
  const LessCounter({required this.counter, super.key});

  final int counter;

  @override
  Widget build(BuildContext context) => Text(counter.toString());
}