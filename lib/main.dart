import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musics/components/song_list.dart';
import 'package:musics/components/song_player.dart';
import 'package:musics/providers/permission_provider.dart';

void main() async {
  runApp(const ProviderScope(child: Musics()));
}

class Musics extends ConsumerWidget {
  const Musics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasPermission = ref.watch(permissionProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Iris')),
        body: hasPermission
            ? const Column(
                children: [
                  SongList(),
                  SongPlayer(),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Storage Permission Required'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async =>
                          await requestStoragePermission(ref),
                      child: const Text('Request Permission'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
