import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NTJmNDZmMGNjY2NmYWVjNTQ3NzZjYyIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTc1MTg2OTQ1MCwiZXhwIjoxNzUxOTU1ODUwfQ.IXYF7idvNgeEMXVgZ7faiWuV9r7-cjtv91S88fi3lsU"

class PostLoginModel {
  PostLoginModel({
    bool? success,
    String? token,
    String? message,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _token = token;
    _message = message;
  }

  PostLoginModel.fromJson(dynamic json) {
    _success = json['success'];
    _token = json['token'];
    _message = json['message'];
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  bool? _success;
  String? _token;
  String? _message;
  ErrorResponse? errorResponse;
  PostLoginModel copyWith({
    bool? success,
    String? token,
    String? message,
  }) =>
      PostLoginModel(
        success: success ?? _success,
        token: token ?? _token,
        message: message ?? _message,
      );
  bool? get success => _success;
  String? get token => _token;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['token'] = _token;
    map['message'] = _message;
    if (errorResponse != null) {
      map['errors'] = errorResponse!.toJson();
    }
    return map;
  }
}
