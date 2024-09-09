import 'package:flutter/material.dart';
import 'package:flutter_layout/print_layout.dart';

class StackExamplePage extends StatelessWidget {
  const StackExamplePage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: PrintLayout(
          name: 'Stack',
          child: ColoredBox(
            color: Colors.grey,
            child: Stack(
              children: [
                // Positioned(
                //   top: 100,
                //   child: Container(
                //     color: Colors.amber,
                //     height: 100,
                //     width: 100,
                //   ),
                // ),
                // Container(
                //   // color: Colors.blue,
                //   height: 400,
                //   width: 400,
                // ),
                Positioned(
                  bottom: 10,
                  child: PrintLayout(
                    name: '1',
                    child: ColoredBox(
                      color: Colors.red,
                      child: SizedBox(
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  child: PrintLayout(
                    name: '2',
                    child: ColoredBox(
                      color: Colors.green,
                      child: SizedBox(
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 800,
                  child: PrintLayout(
                    name: '3',
                    child: ColoredBox(
                      color: Colors.blue,
                      child: SizedBox(
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(100),
                  child: Text('lfkhfluj'),
                ),
              ],
            ),
          ),
        ),
      );
}