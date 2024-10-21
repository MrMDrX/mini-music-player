import 'package:flutter/material.dart';
import 'package:mini_music/models/playlist_provider.dart';
import 'package:mini_music/models/song_model.dart';
import 'package:mini_music/screens/song_screen.dart';
import 'package:mini_music/widgets/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PlaylistProvider playlistProvider;

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songIdx) {
    playlistProvider.currentSongIdx = songIdx;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SongScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            'PLAYLIST',
            style: TextStyle(
              letterSpacing: 4,
            ),
          ),
          centerTitle: true,
        ),
        drawer: const AppDrawer(),
        body: Consumer<PlaylistProvider>(builder: (context, value, child) {
          final List<Song> playlist = value.playlist;
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final Song song = playlist[index];
              return ListTile(
                title: Text(song.name),
                subtitle: Text(song.artist),
                leading: Image.asset(song.imagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        }));
  }
}
