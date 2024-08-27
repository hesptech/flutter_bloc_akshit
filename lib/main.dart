import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_akshit/features/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc_akshit/features/counter/ui/screens/shared/custom_bottom_navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()..add(CounterIncrementevent()))
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const CustomBottomNavigation(),
      ),
    );
  }
}
