import 'package:flutter/material.dart';
import 'package:mini_music/models/playlist_provider.dart';
import 'package:mini_music/widgets/neu_box.dart';
import 'package:provider/provider.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      final playlist = value.playlist;
      final currentSong = playlist[value.currentSongIdx ?? 0];

      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 28,
                      ),
                    ),
                    const Text(
                      "NOW PLAYING",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          size: 28,
                        ))
                  ],
                ),
                //const SizedBox(height: 24),
                NeuBox(
                    child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(currentSong.imagePath),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentSong.name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                currentSong.artist,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                size: 32,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    )
                  ],
                )),
                const SizedBox(height: 24),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("00:00"),
                          Icon(Icons.shuffle_rounded, size: 28),
                          Icon(Icons.repeat_rounded, size: 28),
                          Text("03:45"),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 4),
                      ),
                      child: Slider(
                        min: 0,
                        max: 100,
                        value: 50,
                        activeColor: Colors.blueAccent,
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: NeuBox(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.skip_previous_rounded,
                              size: 32,
                            )),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 2,
                      child: NeuBox(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                              size: 32,
                            )),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: NeuBox(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.skip_next_rounded,
                              size: 32,
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    });
  }
}
