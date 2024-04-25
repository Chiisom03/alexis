import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/song.dart';

final currentSongProvider = StateProvider<Song?>((ref) => null);