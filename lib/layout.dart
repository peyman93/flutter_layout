import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  const MyLayout({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            child,
            Text(
              "W: ${constraints.minWidth} --> ${constraints.maxWidth}\n"
              "H: ${constraints.minHeight} --> ${constraints.maxHeight}",
            ),
          ],
        ),
      );
}
