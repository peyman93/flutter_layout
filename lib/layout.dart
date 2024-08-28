import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  const MyLayout({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Text(
              "Width: ${constraints.minWidth} --> ${constraints.maxWidth}\n"
              "Height: ${constraints.minHeight} --> ${constraints.maxHeight}",
            ),
            child,
          ],
        ),
      );
}
