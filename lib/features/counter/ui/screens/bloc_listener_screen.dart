import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_akshit/features/counter/bloc_snackbar/snackbar_bloc.dart';



class BlocListenerScreen extends StatefulWidget {
  const BlocListenerScreen({super.key});

  @override
  State<BlocListenerScreen> createState() => _BlocListenerScreenState();
}

class _BlocListenerScreenState extends State<BlocListenerScreen> {

  SnackbarBloc snackbarBloc = SnackbarBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC LISTENER'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: /* BlocListener<CounterBloc, CounterState>(
        bloc: counterBloc,
        listener: (context, state) {
          if (state is CounterShowSnackbarActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Snackbar')));
          }
        }, */
        BlocListener<SnackbarBloc, SnackbarState>(
          bloc: snackbarBloc,
          listener: (context, state) {
            if(state is SnackbarShowSnackbarActionState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Snackbar II')));
            }
          },

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                  snackbarBloc.add(SnackbarShowSnackbarEvent());
              }, child: const Text('Snackbar'))
            ],
          ),
        ),
      ),

    );
  }
}