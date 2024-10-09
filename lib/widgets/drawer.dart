import 'package:flutter/material.dart';
import 'package:mini_music/screens/about_screen.dart';
import 'package:mini_music/screens/settings_screen.dart';
import 'package:mini_music/widgets/drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Icon(Icons.music_note_outlined,
                size: 64, color: Theme.of(context).colorScheme.inversePrimary),
          ),
          DrawerTile(
            title: 'Home',
            leading: Icons.home_outlined,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          DrawerTile(
            title: 'Settings',
            leading: Icons.settings_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
          DrawerTile(
            title: 'About',
            leading: Icons.info_outline,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
