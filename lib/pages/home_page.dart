import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/components/my_stopwatch.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Simple Stopwatch'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyStopwatch(
              title: 'Título',
              minutes: 0,
              seconds: 10,
            ),
            MyStopwatch(
              title: 'Segundo',
              minutes: 2,
            ),
            MyStopwatch(
              title: 'Terceiro',
              seconds: 20,
            ),
          ],
        ),
      ),
    );
  }
}
