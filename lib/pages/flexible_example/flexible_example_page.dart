import 'package:flutter/material.dart';
import 'package:flutter_layout/print_layout.dart';

class FlexibleExamplePage extends StatelessWidget {
  const FlexibleExamplePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PrintLayout(
          name: 'Page',
          child: ColoredBox(
            color: Colors.grey,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    child: const Center(child: Text("Flexible - Flex 1")),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                    child: const Center(child: Text("Flexible - Flex 2")),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.yellow,
                    child: const Center(child: Text("Flexible - Flex 3")),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: PrintLayout(
                    name: 'first',
                    child: Container(
                      color: Colors.green,
                      child: Text("Fixed Height Widget"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
