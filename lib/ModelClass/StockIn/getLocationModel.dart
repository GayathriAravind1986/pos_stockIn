import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : {"id":"689093c0c7d1edb058a9bc6e","locationId":"68903a7bf7a56be2b7654f2f","locationName":"ALANGULAM"}

class GetLocationModel {
  GetLocationModel({
    bool? success,
    Data? data,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
  }

  GetLocationModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  bool? _success;
  Data? _data;
  ErrorResponse? errorResponse;
  GetLocationModel copyWith({
    bool? success,
    Data? data,
  }) =>
      GetLocationModel(
        success: success ?? _success,
        data: data ?? _data,
      );
  bool? get success => _success;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (errorResponse != null) {
      map['errors'] = errorResponse!.toJson();
    }
    return map;
  }
}

/// id : "689093c0c7d1edb058a9bc6e"
/// locationId : "68903a7bf7a56be2b7654f2f"
/// locationName : "ALANGULAM"

class Data {
  Data({
    String? id,
    String? locationId,
    String? locationName,
  }) {
    _id = id;
    _locationId = locationId;
    _locationName = locationName;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _locationId = json['locationId'];
    _locationName = json['locationName'];
  }
  String? _id;
  String? _locationId;
  String? _locationName;
  Data copyWith({
    String? id,
    String? locationId,
    String? locationName,
  }) =>
      Data(
        id: id ?? _id,
        locationId: locationId ?? _locationId,
        locationName: locationName ?? _locationName,
      );
  String? get id => _id;
  String? get locationId => _locationId;
  String? get locationName => _locationName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['locationId'] = _locationId;
    map['locationName'] = _locationName;
    return map;
  }
}
