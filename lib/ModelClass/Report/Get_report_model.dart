import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : [{"productId":"687b4158172650bdd200114a","productName":"உணவுகள்","unitPrice":8.47,"totalQty":11,"totalTax":0,"totalAmount":94.72},{"productId":"685703321544bf146f676966","productName":"Dhokla","unitPrice":38.14,"totalQty":13,"totalTax":0,"totalAmount":502.65},{"productId":"685701761544bf146f676943","productName":"Gulab Jamun","unitPrice":50.85,"totalQty":4,"totalTax":0,"totalAmount":212.54999999999998},{"productId":"6856fb6c1544bf146f676811","productName":"Hot Dogs","unitPrice":93.22,"totalQty":3,"totalTax":0,"totalAmount":279.65999999999997},{"productId":"6856fe811544bf146f6768b7","productName":"Pani Puri","unitPrice":50.85,"totalQty":7,"totalTax":0,"totalAmount":355.94},{"productId":"685703131544bf146f67695f","productName":"Samosa","unitPrice":25.42,"totalQty":3,"totalTax":0,"totalAmount":80.84},{"productId":"6857013e1544bf146f67693c","productName":"Brownies","unitPrice":38.14,"totalQty":2,"totalTax":0,"totalAmount":76.28},{"productId":"685703601544bf146f67696d","productName":"Pakora","unitPrice":42.37,"totalQty":2,"totalTax":0,"totalAmount":84.74},{"productId":"6856ff2d1544bf146f6768fc","productName":"Pav Bhaji","unitPrice":67.8,"totalQty":1,"totalTax":0,"totalAmount":67.8},{"productId":"6856fc581544bf146f67683f","productName":"மலேசியன் ஆட்டுக்கறி சுக்கா","unitPrice":76.27,"totalQty":6,"totalTax":0,"totalAmount":457.61999999999995}]
/// totalRecords : 16
/// offset : 0
/// limit : 10

class GetReportModel {
  GetReportModel({
    bool? success,
    List<Data>? data,
    num? totalRecords,
    num? offset,
    num? limit,
    num? finalAmount,
    num? finalQty,
    String? userName,
    String? businessName,
    String? address,
    String? phone,
    String? gstNumber,
    String? currencySymbol,
    String? printType,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
    _totalRecords = totalRecords;
    _offset = offset;
    _limit = limit;
    _finalAmount = finalAmount;
    _finalQty = finalQty;
    _userName = userName;
    _businessName = businessName;
    _address = address;
    _phone = phone;
    _gstNumber = gstNumber;
    _currencySymbol = currencySymbol;
    _printType = printType;
  }

  GetReportModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _totalRecords = json['totalRecords'];
    _offset = json['offset'];
    _limit = json['limit'];
    _finalAmount = json['finalAmount'];
    _finalQty = json['finalQty'];
    _userName = json['UserName'];
    _businessName = json['businessName'];
    _address = json['address'];
    _phone = json['phone'];
    _gstNumber = json['gstNumber'];
    _currencySymbol = json['currencySymbol'];
    _printType = json['printType'];
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  bool? _success;
  List<Data>? _data;
  num? _totalRecords;
  num? _offset;
  num? _limit;
  num? _finalAmount;
  num? _finalQty;
  String? _userName;
  String? _businessName;
  String? _address;
  String? _phone;
  String? _gstNumber;
  String? _currencySymbol;
  String? _printType;
  ErrorResponse? errorResponse;
  GetReportModel copyWith({
    bool? success,
    List<Data>? data,
    num? totalRecords,
    num? offset,
    num? limit,
    num? finalAmount,
    num? finalQty,
    String? userName,
    String? businessName,
    String? address,
    String? phone,
    String? gstNumber,
    String? currencySymbol,
    String? printType,
  }) =>
      GetReportModel(
        success: success ?? _success,
        data: data ?? _data,
        totalRecords: totalRecords ?? _totalRecords,
        offset: offset ?? _offset,
        limit: limit ?? _limit,
        finalAmount: finalAmount ?? _finalAmount,
        finalQty: finalQty ?? _finalQty,
        userName: userName ?? _userName,
        businessName: businessName ?? _businessName,
        address: address ?? _address,
        phone: phone ?? _phone,
        gstNumber: gstNumber ?? _gstNumber,
        currencySymbol: currencySymbol ?? _currencySymbol,
        printType: printType ?? _printType,
      );
  bool? get success => _success;
  List<Data>? get data => _data;
  num? get totalRecords => _totalRecords;
  num? get offset => _offset;
  num? get limit => _limit;
  num? get finalAmount => _finalAmount;
  num? get finalQty => _finalQty;
  String? get userName => _userName;
  String? get businessName => _businessName;
  String? get address => _address;
  String? get phone => _phone;
  String? get gstNumber => _gstNumber;
  String? get currencySymbol => _currencySymbol;
  String? get printType => _printType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['totalRecords'] = _totalRecords;
    map['offset'] = _offset;
    map['limit'] = _limit;
    map['finalAmount'] = _finalAmount;
    map['finalQty'] = _finalQty;
    map['UserName'] = _userName;
    map['businessName'] = _businessName;
    map['address'] = _address;
    map['phone'] = _phone;
    map['gstNumber'] = _gstNumber;
    map['currencySymbol'] = _currencySymbol;
    map['printType'] = _printType;
    if (errorResponse != null) {
      map['errors'] = errorResponse!.toJson();
    }
    return map;
  }
}

/// productId : "687b4158172650bdd200114a"
/// productName : "உணவுகள்"
/// unitPrice : 8.47
/// totalQty : 11
/// totalTax : 0
/// totalAmount : 94.72

class Data {
  Data({
    String? productId,
    String? productName,
    num? unitPrice,
    num? totalQty,
    num? totalTax,
    num? totalAmount,
  }) {
    _productId = productId;
    _productName = productName;
    _unitPrice = unitPrice;
    _totalQty = totalQty;
    _totalTax = totalTax;
    _totalAmount = totalAmount;
  }

  Data.fromJson(dynamic json) {
    _productId = json['productId'];
    _productName = json['productName'];
    _unitPrice = json['unitPrice'];
    _totalQty = json['totalQty'];
    _totalTax = json['totalTax'];
    _totalAmount = json['totalAmount'];
  }
  String? _productId;
  String? _productName;
  num? _unitPrice;
  num? _totalQty;
  num? _totalTax;
  num? _totalAmount;
  Data copyWith({
    String? productId,
    String? productName,
    num? unitPrice,
    num? totalQty,
    num? totalTax,
    num? totalAmount,
  }) =>
      Data(
        productId: productId ?? _productId,
        productName: productName ?? _productName,
        unitPrice: unitPrice ?? _unitPrice,
        totalQty: totalQty ?? _totalQty,
        totalTax: totalTax ?? _totalTax,
        totalAmount: totalAmount ?? _totalAmount,
      );
  String? get productId => _productId;
  String? get productName => _productName;
  num? get unitPrice => _unitPrice;
  num? get totalQty => _totalQty;
  num? get totalTax => _totalTax;
  num? get totalAmount => _totalAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['productName'] = _productName;
    map['unitPrice'] = _unitPrice;
    map['totalQty'] = _totalQty;
    map['totalTax'] = _totalTax;
    map['totalAmount'] = _totalAmount;
    return map;
  }
}
