import 'package:flutter/material.dart';

class People extends StatelessWidget {
  const People({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Selected People:'),
            const SizedBox(height: 8),
            ...peopleList(),
          ],
        ),
      );

  List<Widget> peopleList() {
    int i = 0;

    return [
      for (i; i < 15; i++)
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
    ];
  }
}
