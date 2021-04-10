import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttour/utils/app_config.dart';
import 'package:fluttour/utils/app_credential.dart';

class APIClient {
  APIClient() {
    if (!kReleaseMode) {
      dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
    }
  }

  /// Credential info
  String token;

  /// Get base url by env
  final String apiBaseUrl = Config.I.env.apiBaseUrl;
  final String apiBaseSocketUrl = Config.I.env.apiBaseSocketUrl;
  final Dio dio = Dio();

  /// Get request header options
  Future<Options> getOptions(
      {String contentType = Headers.jsonContentType}) async {
    final Map<String, String> header = <String, String>{};
    return Options(headers: header, contentType: contentType);
  }

  /// Get auth header options
  Future<Options> getAuthOptions({String contentType, String urlPath}) async {
    token = await Credential().getToken();
    print('TOKEN: ===============> $token');
    String platform = '';
    if (Platform.isAndroid) {
      platform = 'android';
    } else if (Platform.isIOS) {
      // iOS-specific code
      platform = 'ios';
    }
    print('Platform: $platform');
    final Options options = await getOptions(contentType: contentType);

    final int timeSt = DateTime.now().millisecondsSinceEpoch;
    options.headers.addAll(<String, String>{'Authorization-Version': '1.0'});
    options.headers.addAll(<String, String>{'Authorization-Timestamp': '$timeSt'});
    options.headers.addAll(<String, String>{'Authorization-Device': 'android'});
    options.headers.addAll(<String, String>{'Accept-Language': 'en-US'});

    final List<int> key = utf8.encode(urlPath);
    final List<int> bytes = utf8.encode('android\n$timeSt\n1.0');
    final Hmac hmacSha1 = Hmac(sha1, key);
    final Digest sha1Result = hmacSha1.convert(bytes);

    String authorizationValue;
    if (token != null) {
      authorizationValue = '$token:$sha1Result';
    } else {
      authorizationValue = ':$sha1Result';
    }
    final String base64Str = base64.encode(utf8.encode(authorizationValue));
    options.headers.addAll(<String, String>{'Authorization': base64Str});
    return options;
  }

  /// Wrap Dio Exception
  Future<Response<T>> wrapE<T>(Future<Response<T>> Function() dioApi) async {
    try {
      return await dioApi();
    } catch (error) {
      if (error is DioError && error.type == DioErrorType.RESPONSE) {
        final Response<dynamic> response = error.response;
        final String errorMessage =
            'Code ${response.statusCode} - ${response.statusMessage} ${response.data != null ? '\n' : ''} ${response.data}';
        throw DioError(
            request: error.request,
            response: error.response,
            type: error.type,
            error: errorMessage);
      }
      rethrow;
    }
  }
}
