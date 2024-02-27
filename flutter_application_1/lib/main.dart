import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: BlocProvider(
            create: (context) => CounterCubit(),
            child: MyWidget(
              label: 'Hello World!',
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String label;
  const MyWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    print('MyWidget build');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Counter1(),
        SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            context.read<CounterCubit>().incrementCounter1();
          },
          child: Text('Incrementa'),
        ),
        SizedBox(height: 80),
        Counter2(),
        SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            context.read<CounterCubit>().incrementCounter2();
          },
          child: Text('Incrementa'),
        ),
      ],
    );
  }
}

class Counter1 extends StatelessWidget {
  const Counter1({super.key});

  @override
  Widget build(BuildContext context) {
    print('Counter1 build');
    //final counter = context.watch<CounterCubit>().state.counter;
    final counter = context.select((CounterCubit bloc) => bloc.state.counter);

    return Text(counter.toString());
  }
}

class Counter2 extends StatelessWidget {
  const Counter2({super.key});

  @override
  Widget build(BuildContext context) {
    print('Counter2 build');
    //final counter = context.watch<CounterCubit>().state.counter2;
    final counter = context.select((CounterCubit bloc) => bloc.state.counter2);

    return Text(counter.toString());
  }
}

class MyStatefulWidget extends StatefulWidget {
  final int initialCount;
  final String label;

  const MyStatefulWidget({
    super.key,
    required this.label,
    required this.initialCount,
  });

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late int counter = widget.initialCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${widget.label} $counter'),
        SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter += 1;
            });
          },
          child: Text('Incrementa'),
        ),
      ],
    );
  }
}
