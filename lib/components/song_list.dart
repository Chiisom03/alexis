import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musics/models/song.dart';
import 'package:musics/providers/song_provider.dart';
import 'package:musics/utils/audio_controls.dart';
import 'package:permission_handler/permission_handler.dart';

class SongList extends ConsumerStatefulWidget {
  const SongList({super.key});

  @override
  SongListState createState() => SongListState();
}

class SongListState extends ConsumerState<SongList> {
  late AudioPlayer player = AudioPlayer();
  final _songs = StateProvider<List<Song>>((ref) => <Song>[]);

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  Future<void> _loadSongs() async {
    final storage = await Permission.storage.request();

    if (storage.isGranted) {
      final directory = Directory("/storage/emulated/0/Music/Telegram");

      final files = directory
          .listSync()
          .where((entity) => entity is File && entity.path.endsWith('.mp3'))
          .toList();

      ref.read(_songs.notifier).state = files.map((file) {
        var songTitle =
            file.path.split('/').last.split('.').first.split('-').last.trim();
        var songArtiste =
            file.path.split('/').last.split('.').first.split('-').first.trim();
        return Song(
            url: DeviceFileSource(file.path),
            title: songTitle,
            artiste: songArtiste,
            album: '');
      }).toList();
    } else {
      if (kDebugMode) {
        print('Permission Denied');
      }
    }
  }

  @override
  void dispose() {
    player.dispose();
    _loadSongs();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var songs = ref.watch(_songs);
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => _loadSongs(),
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            final song = songs[index];
            return ListTile(
              title: Text(
                song.title,
                style: const TextStyle(
                    fontSize: 18, overflow: TextOverflow.ellipsis),
              ),
              subtitle: Text(
                song.artiste,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
              selectedTileColor: Colors.blue,
              selected: song == ref.watch(currentSongProvider),
              onTap: () {
                ref.read(currentSongProvider.notifier).state = song;
                firstPlay(ref, url: song.url);
              },
            );
          },
        ),
      ),
    );
  }
}
