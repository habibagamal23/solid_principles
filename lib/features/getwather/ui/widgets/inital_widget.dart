import 'package:flutter/material.dart';

class InitialMessage extends StatelessWidget {
  const InitialMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Enter a city to get weather.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
