import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_page2.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage2(),
      ),
    );
  }
}

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    print('build istedi');
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyHomePage2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(builder: (context, state) {
              print('BlocBuilder isgtedi');
              return Text(
                '$state',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Detail2Page(),
                  ),
                );
              },
              child: const Text('go detail'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  increment() => emit(state + 1);

  decrement() => emit(state - 1);
}
