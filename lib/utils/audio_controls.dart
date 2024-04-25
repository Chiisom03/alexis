import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioPlayerProvider = Provider((ref) => AudioPlayer());

final playerStateProvider =
    StateProvider<PlayerState>((ref) => PlayerState.stopped);

final currentPositionProvider = StreamProvider<Duration>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.onPositionChanged;
});

final durationProvider = StreamProvider<Duration>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return audioPlayer.onDurationChanged;
});

void firstPlay(WidgetRef ref, {required Source url}) async {
  final player = ref.watch(audioPlayerProvider);
  final playerState = ref.watch(playerStateProvider);

  if (playerState == PlayerState.playing) {
    await player.stop();
    ref.read(playerStateProvider.notifier).state = PlayerState.paused;
    await player.play(url);
    ref.read(playerStateProvider.notifier).state = PlayerState.playing;
  } else {
    await player.play(url);
    ref.read(playerStateProvider.notifier).state = PlayerState.playing;
  }
}

void playAudio(WidgetRef ref, {required Source url}) async {
  final player = ref.watch(audioPlayerProvider);
  final playerState = ref.watch(playerStateProvider);

  if (playerState == PlayerState.playing) {
    await player.pause();
    ref.read(playerStateProvider.notifier).state = PlayerState.paused;
  } else {
    await player.setSource(url);
    await player.resume();
    ref.read(playerStateProvider.notifier).state = PlayerState.playing;
  }
}

void pauseAudio(WidgetRef ref) async {
  final player = ref.watch(audioPlayerProvider);
  ref.read(playerStateProvider.notifier).state = PlayerState.paused;
  await player.pause();
}

void stopAudio(WidgetRef ref) async {
  final player = ref.watch(audioPlayerProvider);
  ref.read(playerStateProvider.notifier).state = PlayerState.stopped;
  await player.stop();
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$minutes:$seconds";
}

Widget buildProgressSlider(WidgetRef ref) {
  final currentPosition = ref.watch(currentPositionProvider);
  final duration = ref.watch(durationProvider);

  return Row(
    children: [
      Text(
        currentPosition.asData?.value != null
            ? formatDuration(currentPosition.asData!.value)
            : '',
      ),
      Expanded(
        child: Slider(
          value: currentPosition.asData?.value.inMilliseconds.toDouble() ?? 0.0,
          min: 0.0,
          max: duration.asData?.value.inMilliseconds.toDouble() ?? 0.0,
          onChanged: (value) => ref
              .watch(audioPlayerProvider)
              .seek(Duration(milliseconds: value.round())),
        ),
      ),
      Text(
        duration.asData?.value != null
            ? formatDuration(duration.asData!.value)
            : '',
      )
    ],
  );
}
