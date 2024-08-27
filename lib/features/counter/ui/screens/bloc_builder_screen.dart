import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_bloc.dart';

class BlocBuilderScreen extends StatefulWidget {
  const BlocBuilderScreen({super.key});

  @override
  State<BlocBuilderScreen> createState() => _BlocBuilderScreenState();
}

class _BlocBuilderScreenState extends State<BlocBuilderScreen> {
  CounterBloc counterBloc = CounterBloc();

  /* @override
  void initState() {
    counterBloc.add(CounterIncrementevent());
    super.initState();
  } */
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC BUILDER'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      /* body: BlocBuilder<CounterBloc, CounterState>(
        bloc: counterBloc,
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
                    Text('data')
                  ],
                ),
              );
              
            default:
              return const Center(child: Text("Not found"),);
          }
          
        },
      ), */


      body: BlocBuilder<CounterBloc, CounterState>(
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
                  ],
                ),
              );
              
            default:
              return const Center(child: Text("Not found"),);
          }
          
        },
      ),


      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            context.read<CounterBloc>().add(CounterIncrementevent());
          }),
    );
  }
}