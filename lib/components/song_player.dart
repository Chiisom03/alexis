import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:marquee/marquee.dart';
import 'package:musics/providers/song_provider.dart';
import 'package:musics/utils/audio_controls.dart';

class SongPlayer extends ConsumerWidget {
  const SongPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerStateProvider);
    final currentSong = ref.watch(currentSongProvider);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: currentSong == null
          ? const Center(child: Text('No Song Selected'))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // currentSong.title.length > 10
                    Text(currentSong.title),
                    //  Marquee(
                    //     text: 'fdjkfdkfjdddddddddddddddddddd',
                    //     style: const TextStyle(fontWeight: FontWeight.bold),
                    //     scrollAxis: Axis.horizontal,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                        
                    //     velocity: 10,
                    //     pauseAfterRound: const Duration(seconds: 1),
                    //     showFadingOnlyWhenScrolling: true,
                    //     fadingEdgeStartFraction: 0.1,
                    //     fadingEdgeEndFraction: 0.1,
                    //     numberOfRounds: 3,
                    //     startPadding: 10,
                    //     accelerationDuration: const Duration(seconds: 1),
                    //     accelerationCurve: Curves.linear,
                    //     decelerationDuration: const Duration(milliseconds: 100),
                    //     decelerationCurve: Curves.easeOut,
                    //     textDirection: TextDirection.ltr,
                    //   ),
                
                Text(currentSong.artiste),
                buildProgressSlider(ref),
                IconButton(
                  icon: Icon(
                    playerState == PlayerState.playing
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  onPressed: () => playAudio(ref, url: currentSong.url),
                ),
              ],
            ),
    );
  }
}
