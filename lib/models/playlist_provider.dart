import 'package:flutter/material.dart';
import 'package:mini_music/models/song_model.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        name: "Purpose",
        artist: "NEFFEX",
        imagePath: "assets/images/NEFFEX - Purpose.jpg",
        audioPath: "assets/audio/NEFFEX - Purpose.mp3"),
    Song(
        name: "Unstoppable",
        artist: "The Score",
        imagePath: "assets/images/The Score - Unstoppable.jpg",
        audioPath: "assets/audio/The Score - Unstoppable.mp3"),
    Song(
        name: "Tourner Dans Le Vide",
        artist: "Indila",
        imagePath: "assets/images/Indila - Tourner Dans Le Vide.jpg",
        audioPath: "assets/audio/Indila - Tourner Dans Le Vide.mp3"),
  ];

  int? _currentSongIdx;

  List<Song> get playlist => _playlist;
  int? get currentSongIdx => _currentSongIdx;

  set currentSongIdx(int? newIdx) {
    _currentSongIdx = newIdx;
    notifyListeners();
  }
}
