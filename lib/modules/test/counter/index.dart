import 'package:aiproof/modules/test/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class TestCounterScreen extends StatelessWidget {
  const TestCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bloc Demo APP"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterInitial) {
            return _counter(context, 0);
          }
          if (state is UpdateState) {
            return _counter(context, state.counter);
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget _counter(BuildContext context, int counter) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          counter.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.red,
              elevation: 0.0,
              height: 50,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Text(
                "-",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              onPressed: () {
                context.read<CounterBloc>().add(NumberDecreaseEvent());
              },
            ),
            const SizedBox(
              width: 50,
            ),
            MaterialButton(
              color: Colors.green,
              elevation: 0.0,
              height: 50,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Text(
                "+",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              onPressed: () {
                context.read<CounterBloc>().add(NumberIncreaseEvent());
              },
            ),
          ],
        )
      ],
    ),
  );
}
