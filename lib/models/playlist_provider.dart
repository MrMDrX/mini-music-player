import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mini_music/models/song_model.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        name: "Purpose",
        artist: "NEFFEX",
        imagePath: "assets/images/NEFFEX - Purpose.jpg",
        audioPath: "audio/NEFFEX - Purpose.mp3"),
    Song(
        name: "Unstoppable",
        artist: "The Score",
        imagePath: "assets/images/The Score - Unstoppable.jpg",
        audioPath: "audio/The Score - Unstoppable.mp3"),
    Song(
        name: "Tourner Dans Le Vide",
        artist: "Indila",
        imagePath: "assets/images/Indila - Tourner Dans Le Vide.jpg",
        audioPath: "audio/Indila - Tourner Dans Le Vide.mp3"),
  ];

  int? _currentSongIdx;

  /* audio players */

  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  PlaylistProvider() {
    listenToDuration();
  }

  bool _isPlaying = false;

  void play() async {
    final String path = _playlist[_currentSongIdx!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() async {
    _isPlaying ? pause() : resume();
    notifyListeners();
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void playNextSong() {
    if (currentSongIdx != null) {
      if (currentSongIdx! < _playlist.length - 1) {
        currentSongIdx = currentSongIdx! + 1;
      } else {
        currentSongIdx = 0;
      }
    }
  }

  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 5) {
      seek(Duration.zero);
    } else {
      if (currentSongIdx! > 0) {
        currentSongIdx = currentSongIdx! - 1;
      } else {
        currentSongIdx = _playlist.length - 1;
      }
    }
  }

  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }
  // dispose audio player

  List<Song> get playlist => _playlist;
  int? get currentSongIdx => _currentSongIdx;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIdx(int? newIdx) {
    _currentSongIdx = newIdx;
    if (newIdx != null) {
      play();
    }
    notifyListeners();
  }
}
