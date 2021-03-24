import 'package:flutter/cupertino.dart';
import 'package:fluttour/utils/app_storage.dart';

class Credential with ChangeNotifier {
  Credential(this._storage);

  // PRIVATE PROPERTIES
  // -----------------
  // Local storage
  final Storage _storage;

  String _token;

  // PUBLIC PROPERTIES
  // -----------------
  // Get user info
  String get token => _token;

  set token(String value) {
    _token = value;
    isLogged = _token != null;
    notifyListeners();
  }

  bool get isLogged {
    return token != null;
  }

  set isLogged(bool value) {
    notifyListeners();
  }

  // Load credential
  Future<bool> getToken() async {
    final String tokenRaw = await _storage.getData<String>(LocalStorageKey.userToken);
    token = tokenRaw;
    return token != null;
  }

  // Store credential
  Future<bool> saveToken(String appToken) async {
    final bool saveRes = await _storage.saveData(LocalStorageKey.userToken, appToken);
    if (saveRes) {
      token = appToken;
    }
    return saveRes;
  }
}