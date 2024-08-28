import 'package:flutter/material.dart';
import 'package:flutter_layout/pages/home/widgets/people.dart';
import 'package:flutter_layout/pages/home/widgets/products.dart';

import 'widgets/header.dart';
import 'widgets/update.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _body(),
      );

  Widget _body() => const SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 8),
            Update(),
            SizedBox(height: 32),
            SizedBox(height: 120, child: Products()),
            SizedBox(height: 32),
            People(),
          ],
        ),
      );
}
