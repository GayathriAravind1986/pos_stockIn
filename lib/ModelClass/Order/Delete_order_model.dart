import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// message : "Order and related payments deleted successfully"

class DeleteOrderModel {
  DeleteOrderModel({
    bool? success,
    String? message,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _message = message;
  }

  DeleteOrderModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  bool? _success;
  String? _message;
  ErrorResponse? errorResponse;
  DeleteOrderModel copyWith({
    bool? success,
    String? message,
  }) =>
      DeleteOrderModel(
        success: success ?? _success,
        message: message ?? _message,
      );
  bool? get success => _success;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (errorResponse != null) {
      map['errors'] = errorResponse!.toJson();
    }
    return map;
  }
}
