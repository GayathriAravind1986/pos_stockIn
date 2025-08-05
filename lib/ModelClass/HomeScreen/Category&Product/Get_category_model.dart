import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : [{"id":"685b7f628753e2ece10465be","name":"Juice","isAvailable":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826850/categories/ananghrlrx4igveboime.webp","createdBy":"Saranya","createdAt":"2025-06-25","updatedAt":"2025-06-25T04:47:30.233Z","statusText":"Available","productCount":5},{"id":"6855420d400f8fb4c8c8c7f2","name":"Ice Creams","isAvailable":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750925043/categories/rkck9gp0mt6xczzrj1ot.webp","createdBy":"Saranya","createdAt":"2025-06-20","updatedAt":"2025-06-26T08:04:22.256Z","statusText":"Available","productCount":2},{"id":"685541db400f8fb4c8c8c7ee","name":"Cakes","isAvailable":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826817/categories/grxwq0v6cxzaqi4kp2up.jpg","createdBy":"Saranya","createdAt":"2025-06-20","updatedAt":"2025-06-25T04:46:57.879Z","statusText":"Available","productCount":3}]
/// totalCount : 3

class GetCategoryModel {
  GetCategoryModel({
    bool? success,
    List<Data>? data,
    num? totalCount,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
    _totalCount = totalCount;
  }

  GetCategoryModel.fromJson(dynamic json) {
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
  GetCategoryModel copyWith({
    bool? success,
    List<Data>? data,
    num? totalCount,
  }) =>
      GetCategoryModel(
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

/// id : "685b7f628753e2ece10465be"
/// name : "Juice"
/// isAvailable : true
/// image : "https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826850/categories/ananghrlrx4igveboime.webp"
/// createdBy : "Saranya"
/// createdAt : "2025-06-25"
/// updatedAt : "2025-06-25T04:47:30.233Z"
/// statusText : "Available"
/// productCount : 5

class Data {
  Data({
    String? id,
    String? name,
    bool? isAvailable,
    String? image,
    num? sortOrder,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
    String? statusText,
    num? productCount,
  }) {
    _id = id;
    _name = name;
    _isAvailable = isAvailable;
    _image = image;
    _sortOrder = sortOrder;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _statusText = statusText;
    _productCount = productCount;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isAvailable = json['isAvailable'];
    _image = json['image'];
    _sortOrder = json['sortOrder'];
    _createdBy = json['createdBy'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _statusText = json['statusText'];
    _productCount = json['productCount'];
  }
  String? _id;
  String? _name;
  bool? _isAvailable;
  String? _image;
  num? _sortOrder;
  String? _createdBy;
  String? _createdAt;
  String? _updatedAt;
  String? _statusText;
  num? _productCount;
  Data copyWith({
    String? id,
    String? name,
    bool? isAvailable,
    String? image,
    num? sortOrder,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
    String? statusText,
    num? productCount,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        isAvailable: isAvailable ?? _isAvailable,
        image: image ?? _image,
        sortOrder: sortOrder ?? _sortOrder,
        createdBy: createdBy ?? _createdBy,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        statusText: statusText ?? _statusText,
        productCount: productCount ?? _productCount,
      );
  String? get id => _id;
  String? get name => _name;
  bool? get isAvailable => _isAvailable;
  String? get image => _image;
  num? get sortOrder => _sortOrder;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get statusText => _statusText;
  num? get productCount => _productCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['isAvailable'] = _isAvailable;
    map['image'] = _image;
    map['sortOrder'] = _sortOrder;
    map['createdBy'] = _createdBy;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['statusText'] = _statusText;
    map['productCount'] = _productCount;
    return map;
  }
}
