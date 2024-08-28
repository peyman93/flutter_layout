import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   int i = 0;

  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 16),
  //       child: Row(
  //         children: [
  //           for (i; i < 100; i++) Container(
  //             margin: EdgeInsets.only(right: 8),
  //             width: 100,
  //             height: 100,
  //             decoration: BoxDecoration(
  //               color: Colors.yellow,
  //               borderRadius: BorderRadius.circular(16)
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Selected Products:'),
            const SizedBox(height: 8),
            Expanded(child: _products()),
          ],
        ),
      );

  Widget _products() => ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (_, __) => Container(
          margin: const EdgeInsets.only(right: 8),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(16)),
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
      );
}
