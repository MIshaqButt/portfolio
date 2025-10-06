import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class SecuredPrefs {
  static const _instance = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(),
  );

  Future<dynamic> read(String key) async {
    final data = await _instance.read(key: key);

    return data == null ? null : jsonDecode(data);
  }

  Future<void> clear() async => await _instance.deleteAll();

  // TODO fill out this metho later on...
  Future<String?> readToken() async {
    return null;
  }
}
