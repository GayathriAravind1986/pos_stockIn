import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : {"location":{"address":"11 Big street","city":"Madrasa","state":"Tamil Nadu","zipCode":"600001","country":"India"},"_id":"6856f95deb6dfad25c44a4dc","name":"Roja Restaurant","contactNumber":"+91-9876543210","email":"shop@example.com","gstNumber":"29ABCDE1234F2Z5","currencySymbol":"₹","createdAt":"2025-06-21T18:26:37.059Z","__v":0,"printType":"imin","image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1753242759/shop/kkjy42ffngbjjmgtdjbi.jpg","logo":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1753353183/shop/wygsmmmmqk4ko4rzrkbl.jpg"}

class GetShopDetailsWithoutTokenModel {
  GetShopDetailsWithoutTokenModel({
    bool? success,
    Data? data,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
  }

  GetShopDetailsWithoutTokenModel.fromJson(dynamic json) {
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
  GetShopDetailsWithoutTokenModel copyWith({
    bool? success,
    Data? data,
  }) =>
      GetShopDetailsWithoutTokenModel(
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

/// location : {"address":"11 Big street","city":"Madrasa","state":"Tamil Nadu","zipCode":"600001","country":"India"}
/// _id : "6856f95deb6dfad25c44a4dc"
/// name : "Roja Restaurant"
/// contactNumber : "+91-9876543210"
/// email : "shop@example.com"
/// gstNumber : "29ABCDE1234F2Z5"
/// currencySymbol : "₹"
/// createdAt : "2025-06-21T18:26:37.059Z"
/// __v : 0
/// printType : "imin"
/// image : "https://res.cloudinary.com/dm6wrm7vf/image/upload/v1753242759/shop/kkjy42ffngbjjmgtdjbi.jpg"
/// logo : "https://res.cloudinary.com/dm6wrm7vf/image/upload/v1753353183/shop/wygsmmmmqk4ko4rzrkbl.jpg"

class Data {
  Data({
    Location? location,
    String? id,
    String? name,
    String? contactNumber,
    String? email,
    String? gstNumber,
    String? currencySymbol,
    String? createdAt,
    num? v,
    String? printType,
    String? image,
    String? logo,
  }) {
    _location = location;
    _id = id;
    _name = name;
    _contactNumber = contactNumber;
    _email = email;
    _gstNumber = gstNumber;
    _currencySymbol = currencySymbol;
    _createdAt = createdAt;
    _v = v;
    _printType = printType;
    _image = image;
    _logo = logo;
  }

  Data.fromJson(dynamic json) {
    _location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    _id = json['_id'];
    _name = json['name'];
    _contactNumber = json['contactNumber'];
    _email = json['email'];
    _gstNumber = json['gstNumber'];
    _currencySymbol = json['currencySymbol'];
    _createdAt = json['createdAt'];
    _v = json['__v'];
    _printType = json['printType'];
    _image = json['image'];
    _logo = json['logo'];
  }
  Location? _location;
  String? _id;
  String? _name;
  String? _contactNumber;
  String? _email;
  String? _gstNumber;
  String? _currencySymbol;
  String? _createdAt;
  num? _v;
  String? _printType;
  String? _image;
  String? _logo;
  Data copyWith({
    Location? location,
    String? id,
    String? name,
    String? contactNumber,
    String? email,
    String? gstNumber,
    String? currencySymbol,
    String? createdAt,
    num? v,
    String? printType,
    String? image,
    String? logo,
  }) =>
      Data(
        location: location ?? _location,
        id: id ?? _id,
        name: name ?? _name,
        contactNumber: contactNumber ?? _contactNumber,
        email: email ?? _email,
        gstNumber: gstNumber ?? _gstNumber,
        currencySymbol: currencySymbol ?? _currencySymbol,
        createdAt: createdAt ?? _createdAt,
        v: v ?? _v,
        printType: printType ?? _printType,
        image: image ?? _image,
        logo: logo ?? _logo,
      );
  Location? get location => _location;
  String? get id => _id;
  String? get name => _name;
  String? get contactNumber => _contactNumber;
  String? get email => _email;
  String? get gstNumber => _gstNumber;
  String? get currencySymbol => _currencySymbol;
  String? get createdAt => _createdAt;
  num? get v => _v;
  String? get printType => _printType;
  String? get image => _image;
  String? get logo => _logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['_id'] = _id;
    map['name'] = _name;
    map['contactNumber'] = _contactNumber;
    map['email'] = _email;
    map['gstNumber'] = _gstNumber;
    map['currencySymbol'] = _currencySymbol;
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    map['printType'] = _printType;
    map['image'] = _image;
    map['logo'] = _logo;
    return map;
  }
}

/// address : "11 Big street"
/// city : "Madrasa"
/// state : "Tamil Nadu"
/// zipCode : "600001"
/// country : "India"

class Location {
  Location({
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) {
    _address = address;
    _city = city;
    _state = state;
    _zipCode = zipCode;
    _country = country;
  }

  Location.fromJson(dynamic json) {
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _zipCode = json['zipCode'];
    _country = json['country'];
  }
  String? _address;
  String? _city;
  String? _state;
  String? _zipCode;
  String? _country;
  Location copyWith({
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) =>
      Location(
        address: address ?? _address,
        city: city ?? _city,
        state: state ?? _state,
        zipCode: zipCode ?? _zipCode,
        country: country ?? _country,
      );
  String? get address => _address;
  String? get city => _city;
  String? get state => _state;
  String? get zipCode => _zipCode;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['zipCode'] = _zipCode;
    map['country'] = _country;
    return map;
  }
}
