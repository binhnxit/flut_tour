import 'dart:core';

class BaseResponse<T> {
  BaseResponse(Map<String, dynamic> fullJson,
      {String dataKey = 'data', String errorKey = 'error', String eventKey = 'event', String describeKey = 'describe'}) {
    parsing(fullJson, dataKey: dataKey, errorKey: errorKey, eventKey: eventKey, describeKey: describeKey);
  }

  T data;
  BaseError error;
  String event;
  String describe;

  /// Abstract json to data
  T jsonToData(dynamic dataJson) {
    return null;
  }

  /// Abstract data to json
  dynamic dataToJson(T data) {
    return null;
  }

  /// Parsing data to object
  /// dataKey = null mean parse from root
  dynamic parsing(Map<String, dynamic> fullJson,
      {String dataKey = 'data', String errorKey = 'error', String eventKey = 'event', String describeKey = 'describe'}) {
    if (fullJson != null) {
      final dynamic dataJson = dataKey != null ? fullJson[dataKey] : fullJson;
      final dynamic errorJson = errorKey != null ? fullJson[errorKey] : fullJson;
      final String eventData = eventKey != null ? fullJson[eventKey] as String : '';
      final String describeData = eventKey != null ? fullJson[describeKey] as String : '';
      event = eventData;
      describe = describeData;
      data = (event != 'ERROR' && event != 'UNAUTHORIZED') ? (dataJson != null ? jsonToData(dataJson) : null) : null;
      error = errorJson != null ? BaseError.fromJson(errorJson as Map<String, dynamic>) : null;

    }
  }

  /// Data to json
  Map<String, dynamic> toJson() => <String, dynamic>{
    'data': data != null ? dataToJson(data) : null,
    'error': error?.toJson(),
    'event': event,
    'describe': describe,
  };

  @override
  String toString() {
    return 'BaseResponse{data: $data, error: $error}';
  }
}

class BaseError {
  BaseError({
    this.code,
    this.message,
  });

  factory BaseError.fromJson(Map<String, dynamic> json) => BaseError(
    code: json['code'] as int,
    message: json['message'] as String,
  );

  int code;
  String message;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': code,
    'message': message,
  };

  @override
  String toString() {
    return 'BaseError{code: $code, message: $message}';
  }
}