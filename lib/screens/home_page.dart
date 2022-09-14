import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Consumer(
              builder: (context, ref, _) {
                final count = ref.watch(counterProvider.state).state;
                return Text(
                  '$count',
                  key: const Key('counterState'),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              key: const Key('increment_floatingActionButton'),
              // The read method is a utility to read a provider without listening to it
              onPressed: () => ref.read(counterProvider.state).state++,
              tooltip: 'Increment',
              child: const Icon(Icons.plus_one),
            ),
            FloatingActionButton(
              key: const Key('decrement_floatingActionButton'),
              // The read method is a utility to read a provider without listening to it
              onPressed: () => ref.read(counterProvider.state).state--,
              tooltip: 'Decrement',
              child: const Icon(Icons.exposure_minus_1),
            ),
          ],
        ),
      )

    );
  }
}
