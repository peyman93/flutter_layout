import 'package:flutter/material.dart';

class PrintLayout extends StatelessWidget {
  const PrintLayout({required this.child, this.name, super.key});

  final Widget child;
  final String? name;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          print(
            '$name\n'
            "W: ${constraints.minWidth} --> ${constraints.maxWidth}\n"
            "H: ${constraints.minHeight} --> ${constraints.maxHeight}",
          );
          return child;
        },
      );
}
