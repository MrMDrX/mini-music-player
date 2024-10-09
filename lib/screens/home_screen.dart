import 'package:flutter/material.dart';
import 'package:mini_music/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Music Player'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
