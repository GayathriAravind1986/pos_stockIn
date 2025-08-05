import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : [{"id":"68721cb522da118ea8d7578b","name":"2","isAvailable":true,"createdBy":"Saranya","createdAt":"2025-07-12","updatedAt":"2025-07-12T08:28:37.818Z","statusText":"Available"},{"id":"68721cb022da118ea8d75783","name":"1","isAvailable":true,"createdBy":"Saranya","createdAt":"2025-07-12","updatedAt":"2025-07-12T08:28:32.374Z","statusText":"Available"}]
/// totalCount : 2

class GetTableModel {
  GetTableModel({
    bool? success,
    List<Data>? data,
    num? totalCount,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
    _totalCount = totalCount;
  }

  GetTableModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _totalCount = json['totalCount'];
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  bool? _success;
  List<Data>? _data;
  num? _totalCount;
  ErrorResponse? errorResponse;
  GetTableModel copyWith({
    bool? success,
    List<Data>? data,
    num? totalCount,
  }) =>
      GetTableModel(
        success: success ?? _success,
        data: data ?? _data,
        totalCount: totalCount ?? _totalCount,
      );
  bool? get success => _success;
  List<Data>? get data => _data;
  num? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['totalCount'] = _totalCount;
    if (errorResponse != null) {
      map['errors'] = errorResponse!.toJson();
    }
    return map;
  }
}

/// id : "68721cb522da118ea8d7578b"
/// name : "2"
/// isAvailable : true
/// createdBy : "Saranya"
/// createdAt : "2025-07-12"
/// updatedAt : "2025-07-12T08:28:37.818Z"
/// statusText : "Available"

class Data {
  Data({
    String? id,
    String? name,
    bool? isAvailable,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
    String? statusText,
  }) {
    _id = id;
    _name = name;
    _isAvailable = isAvailable;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _statusText = statusText;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isAvailable = json['isAvailable'];
    _createdBy = json['createdBy'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _statusText = json['statusText'];
  }
  String? _id;
  String? _name;
  bool? _isAvailable;
  String? _createdBy;
  String? _createdAt;
  String? _updatedAt;
  String? _statusText;
  Data copyWith({
    String? id,
    String? name,
    bool? isAvailable,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
    String? statusText,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        isAvailable: isAvailable ?? _isAvailable,
        createdBy: createdBy ?? _createdBy,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        statusText: statusText ?? _statusText,
      );
  String? get id => _id;
  String? get name => _name;
  bool? get isAvailable => _isAvailable;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get statusText => _statusText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['isAvailable'] = _isAvailable;
    map['createdBy'] = _createdBy;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['statusText'] = _statusText;
    return map;
  }
}
