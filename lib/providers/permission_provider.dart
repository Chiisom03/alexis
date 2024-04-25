import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';


final permissionProvider = StateProvider<bool>((ref) => false);

Future<void> savePermissionStatus(bool hasPermission) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('storagePermission', hasPermission);
}

Future<bool> statusCheck() async {
  final prefs = await SharedPreferences.getInstance();
  final savedPermission = prefs.containsKey('storagePermission') ? prefs.getBool('storagePermission') : false;

  if (savedPermission != null && savedPermission) {
    return true;
  } else {
    final status = await Permission.storage.status;
    return status.isGranted;
  }
}

Future<void> requestStoragePermission(WidgetRef ref) async {
  final status = await Permission.storage.request();
  if (status == PermissionStatus.granted) {
    ref.read(permissionProvider.notifier).state = true;
    await savePermissionStatus(true);
  } else {
    // Handle permission denied scenario (optional)
  }
}

