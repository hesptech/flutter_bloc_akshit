import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_consumer/consumer_bloc.dart';

class BlocConsumerScreen extends StatefulWidget {
  const BlocConsumerScreen({super.key});

  @override
  State<BlocConsumerScreen> createState() => _BlocConsumerScreenState();
}

class _BlocConsumerScreenState extends State<BlocConsumerScreen> {
  ConsumerBloc consumerBloc = ConsumerBloc();

  @override
  void initState() {
    consumerBloc.add(ConsumerIncrementevent());
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
      body: BlocConsumer<ConsumerBloc, ConsumerState>(
        bloc: consumerBloc,
        listenWhen: ((previous, current) => current is ConsumerActionState),
        buildWhen: ((previous, current) => current is! ConsumerActionState),
        listener: (context, state) {
          if (state is ConsumerShowSnackbarActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Snackbar')));
          }           
        },
        builder: (context, state) {

          switch(state.runtimeType) {
            case ConsumerIncrementState:
              final successState = state as ConsumerIncrementState;
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
                        consumerBloc.add(ConsumerShowSnackbarEvent());
                      },
                      child: const Text('Snackbar'),
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
            consumerBloc.add(ConsumerIncrementevent());
          }),
    );
  }
}
