import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_bloc.dart';

class BlocListenerScreen extends StatefulWidget {
  const BlocListenerScreen({super.key});

  @override
  State<BlocListenerScreen> createState() => _BlocListenerScreenState();
}

class _BlocListenerScreenState extends State<BlocListenerScreen> {
  CounterBloc counterBloc = CounterBloc();

  @override
  void initState() {
    counterBloc.add(CounterIncrementevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC LISTENER'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: BlocListener<CounterBloc, CounterState>(
        bloc: counterBloc,
        listener: (context, state) {
          if (state is CounterShowSnackbarActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Snackbar')));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                  counterBloc.add(CounterShowSnackbarEvent());
              }, child: const Text('Snackbar'))
            ],
          ),
        ),
      ),

    );
  }
}