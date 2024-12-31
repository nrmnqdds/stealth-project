import 'package:hive_flutter/hive_flutter.dart';

final List<String> localDatabaseBoxes = [
  'settings',
  'developer_settings',
];

class StealthLocalDatabase {
  static Future<void> initialize() async {
    await Future.wait([
      for (final box in localDatabaseBoxes) Hive.openBox(box),
    ]);
  }

  static Future<void> saveData(String box, String key, dynamic value) async {
    await Hive.box(box).put(key, value);
  }

  static dynamic getData(String box, String key, {dynamic defaultValue}) {
    return Hive.box(box).get(
      key,
      defaultValue: defaultValue,
    );
  }

  static Future<void> close() async {
    await Future.wait([
      for (final box in localDatabaseBoxes) Hive.box(box).close(),
    ]);
  }
}

