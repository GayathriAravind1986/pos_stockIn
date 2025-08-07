import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NTJmNDZmMGNjY2NmYWVjNTQ3NzZjYyIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTc1MTg2OTQ1MCwiZXhwIjoxNzUxOTU1ODUwfQ.IXYF7idvNgeEMXVgZ7faiWuV9r7-cjtv91S88fi3lsU"

class PostLoginModel {
  PostLoginModel({
    bool? success,
    String? token,
    User? user,
    String? message,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _token = token;
    _user = user;
    _message = message;
  }

  PostLoginModel.fromJson(dynamic json) {
    _success = json['success'];
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _message = json['message'];
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  bool? _success;
  String? _token;
  User? _user;
  String? _message;
  ErrorResponse? errorResponse;
  PostLoginModel copyWith({
    bool? success,
    String? token,
    User? user,
    String? message,
  }) =>
      PostLoginModel(
        success: success ?? _success,
        token: token ?? _token,
        user: user ?? _user,
        message: message ?? _message,
      );
  bool? get success => _success;
  String? get token => _token;
  User? get user => _user;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['message'] = _message;
    if (errorResponse != null) {
      map['errors'] = errorResponse!.toJson();
    }
    return map;
  }
}

/// _id : "689093c0c7d1edb058a9bc6e"
/// name : "Counter1"
/// email : "counter1@gmail.com"
/// password : "$2b$10$jIwJtQyZdNMNmxWiSNZ0VepS0HjnaZYKOPATrkimPjm78oeklBrLu"
/// role : "OPERATOR"
/// locationId : "68903a7bf7a56be2b7654f2f"
/// active : true
/// createdAt : "2025-08-04T11:04:32.178Z"
/// __v : 0

class User {
  User({
    String? id,
    String? name,
    String? email,
    String? password,
    String? role,
    String? locationId,
    bool? active,
    String? createdAt,
    num? v,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _role = role;
    _locationId = locationId;
    _active = active;
    _createdAt = createdAt;
    _v = v;
  }

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _role = json['role'];
    _locationId = json['locationId'];
    _active = json['active'];
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _role;
  String? _locationId;
  bool? _active;
  String? _createdAt;
  num? _v;
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? role,
    String? locationId,
    bool? active,
    String? createdAt,
    num? v,
  }) =>
      User(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        password: password ?? _password,
        role: role ?? _role,
        locationId: locationId ?? _locationId,
        active: active ?? _active,
        createdAt: createdAt ?? _createdAt,
        v: v ?? _v,
      );
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get role => _role;
  String? get locationId => _locationId;
  bool? get active => _active;
  String? get createdAt => _createdAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['role'] = _role;
    map['locationId'] = _locationId;
    map['active'] = _active;
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    return map;
  }
}
