

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Akshit'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: const Center(
        child: Text('home content'),
      ),
    );
  }
}