import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// Config env
class Config {
  factory Config({Env env}) {
    if (env != null) {
      I.env = env;
    }
    return I;
  }

  Config._private();

  static final Config I = Config._private();

  Env env = Env.dev();
}

/// Environment declare here
class Env {
  Env._({@required this.apiBaseUrl, @required this.googleApiKey, @required this.apiBaseSocketUrl});

  /// Dev environment
  factory Env.dev() {
    return Env._(
        apiBaseUrl: 'https://5cb7edd21551570014da39cc.mockapi.io/',
        googleApiKey: '',
        apiBaseSocketUrl: 'ws://');
  }

  final String apiBaseUrl;
  final String googleApiKey;
  final String apiBaseSocketUrl;
}