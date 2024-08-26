import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_bloc.dart';

class BlocConsumerScreen extends StatefulWidget {
  const BlocConsumerScreen({super.key});

  @override
  State<BlocConsumerScreen> createState() => _BlocConsumerScreenState();
}

class _BlocConsumerScreenState extends State<BlocConsumerScreen> {
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
        title: const Text('BLoC CONSUMER'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        bloc: counterBloc,
        listenWhen: ((previous, current) => current is CounterActionState),
        buildWhen: ((previous, current) => current is! CounterActionState),
        listener: (context, state) {
          if (state is CounterShowSnackbarActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Snackbar')));
          }           
        },
        builder: (context, state) {

          switch(state.runtimeType) {
            case CounterIncrementState:
              final successState = state as CounterIncrementState;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      successState.val.toString(),
                      style: const TextStyle(fontSize: 60),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        counterBloc.add(CounterShowSnackbarEvent());
                      },
                      child: const Text('Snackbar'),
                    ),
                  ],
                ),
              );
              
            default:
              return const Center(child: Text("Not found"),);
          }




          /* return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '0',
                  style: const TextStyle(fontSize: 60),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(CounterShowSnackbarEvent());
                  },
                  child: const Text('Snackbar'),
                )
              ],
            ),
          ); */
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            counterBloc.add(CounterIncrementevent());
          }),
    );
  }
}
