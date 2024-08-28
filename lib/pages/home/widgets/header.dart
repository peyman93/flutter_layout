import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) => const ColoredBox(
        color: Colors.lightGreen,
        child: SizedBox(
          width: double.infinity,
          height: 68,
          child: Center(
            child: Text(
              'My App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      );
}
