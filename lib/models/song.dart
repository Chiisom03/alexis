import 'package:audioplayers/audioplayers.dart';

class Song {
  final String title;
  final String artiste;
  final String album;
  final Source url;

  Song({
    required this.title,
    required this.artiste,
    required this.album,
    required this.url,
  });
}
