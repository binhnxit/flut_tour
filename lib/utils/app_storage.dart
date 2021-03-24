
import 'package:npreferences/npreferences.dart';

abstract class Storage {
  /// Save data with primary data types:
  /// String, List<String>, double, int, bool
  Future<bool> saveData<T>(String key, T value);

  // Get data by key
  Future<T> getData<T>(String key);

  // Clear all
  Future<bool> clear();
}

class LocalStorageKey {
  static const String userToken = 'user_token';

}

class StoragePreferences extends Storage with NPreferences {}