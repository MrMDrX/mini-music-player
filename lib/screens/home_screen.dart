import 'package:flutter/material.dart';
import 'package:mini_music/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'PLAYLIST',
          style: TextStyle(
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
