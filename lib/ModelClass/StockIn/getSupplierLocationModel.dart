import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : [{"_id":"68905b42f7a56be2b7655117","name":"Mani","companyName":"Mani Snacks","address":"Alangulam","contactNumber":"9876543210","email":"","gstNumber":"","locationId":{"_id":"68903a7bf7a56be2b7654f2f","name":"ALANGULAM"},"createdBy":"6890315266eb7a8181a3b4b4","isDefault":true,"createdAt":"2025-08-04T07:03:30.962Z","updatedAt":"2025-08-04T07:03:30.962Z","__v":0}]
/// totalCount : 1

class GetSupplierLocationModel {
  GetSupplierLocationModel({
    bool? success,
    List<Data>? data,
    num? totalCount,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
    _totalCount = totalCount;
  }

  GetSupplierLocationModel.fromJson(dynamic json) {
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
  GetSupplierLocationModel copyWith({
    bool? success,
    List<Data>? data,
    num? totalCount,
  }) =>
      GetSupplierLocationModel(
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

/// _id : "68905b42f7a56be2b7655117"
/// name : "Mani"
/// companyName : "Mani Snacks"
/// address : "Alangulam"
/// contactNumber : "9876543210"
/// email : ""
/// gstNumber : ""
/// locationId : {"_id":"68903a7bf7a56be2b7654f2f","name":"ALANGULAM"}
/// createdBy : "6890315266eb7a8181a3b4b4"
/// isDefault : true
/// createdAt : "2025-08-04T07:03:30.962Z"
/// updatedAt : "2025-08-04T07:03:30.962Z"
/// __v : 0

class Data {
  Data({
    String? id,
    String? name,
    String? companyName,
    String? address,
    String? contactNumber,
    String? email,
    String? gstNumber,
    LocationId? locationId,
    String? createdBy,
    bool? isDefault,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _id = id;
    _name = name;
    _companyName = companyName;
    _address = address;
    _contactNumber = contactNumber;
    _email = email;
    _gstNumber = gstNumber;
    _locationId = locationId;
    _createdBy = createdBy;
    _isDefault = isDefault;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _companyName = json['companyName'];
    _address = json['address'];
    _contactNumber = json['contactNumber'];
    _email = json['email'];
    _gstNumber = json['gstNumber'];
    _locationId = json['locationId'] != null
        ? LocationId.fromJson(json['locationId'])
        : null;
    _createdBy = json['createdBy'];
    _isDefault = json['isDefault'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  String? _companyName;
  String? _address;
  String? _contactNumber;
  String? _email;
  String? _gstNumber;
  LocationId? _locationId;
  String? _createdBy;
  bool? _isDefault;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  Data copyWith({
    String? id,
    String? name,
    String? companyName,
    String? address,
    String? contactNumber,
    String? email,
    String? gstNumber,
    LocationId? locationId,
    String? createdBy,
    bool? isDefault,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        companyName: companyName ?? _companyName,
        address: address ?? _address,
        contactNumber: contactNumber ?? _contactNumber,
        email: email ?? _email,
        gstNumber: gstNumber ?? _gstNumber,
        locationId: locationId ?? _locationId,
        createdBy: createdBy ?? _createdBy,
        isDefault: isDefault ?? _isDefault,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  String? get id => _id;
  String? get name => _name;
  String? get companyName => _companyName;
  String? get address => _address;
  String? get contactNumber => _contactNumber;
  String? get email => _email;
  String? get gstNumber => _gstNumber;
  LocationId? get locationId => _locationId;
  String? get createdBy => _createdBy;
  bool? get isDefault => _isDefault;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['companyName'] = _companyName;
    map['address'] = _address;
    map['contactNumber'] = _contactNumber;
    map['email'] = _email;
    map['gstNumber'] = _gstNumber;
    if (_locationId != null) {
      map['locationId'] = _locationId?.toJson();
    }
    map['createdBy'] = _createdBy;
    map['isDefault'] = _isDefault;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}

/// _id : "68903a7bf7a56be2b7654f2f"
/// name : "ALANGULAM"

class LocationId {
  LocationId({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  LocationId.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
  LocationId copyWith({
    String? id,
    String? name,
  }) =>
      LocationId(
        id: id ?? _id,
        name: name ?? _name,
      );
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    return map;
  }
}
