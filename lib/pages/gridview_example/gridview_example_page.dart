import 'package:flutter/material.dart';
import 'package:flutter_layout/print_layout.dart';

class GridviewExamplePage extends StatelessWidget {
  const GridviewExamplePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PrintLayout(
          name: 'Grid',
          child: SizedBox(
            height: 320,
            width: 320,
            child: GridView(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
              children: [
                PrintLayout(
                  name: "1st",
                  child: Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                  ),
                ),
                PrintLayout(
                  name: '2nd',
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    width: 100,
                  ),
                ),
                PrintLayout(
                  name: "3",
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                ),
                PrintLayout(
                  name: '4',
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                ),
                PrintLayout(
                  name: "1st",
                  child: Container(
                    color: Colors.brown,
                    height: 100,
                    width: 100,
                  ),
                ),
                PrintLayout(
                  name: '2nd',
                  child: Container(
                    color: Colors.yellow,
                    height: 100,
                    width: 100,
                  ),
                ),
                PrintLayout(
                  name: "3",
                  child: Container(
                    color: Colors.blueAccent,
                    height: 100,
                    width: 100,
                  ),
                ),
                PrintLayout(
                  name: '4',
                  child: Container(
                    color: Colors.redAccent,
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
