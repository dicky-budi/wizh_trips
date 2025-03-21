import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> setUpApp() async {
  SecureStorage();
}

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future<void> save(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}
