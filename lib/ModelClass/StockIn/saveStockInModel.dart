import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// data : {"stock":{"date":"2025-07-31T00:00:00.000Z","supplierId":"687a34e9dd6c1943769b0295","taxType":"exclusive","subTotal":5000,"taxTotal":18,"finalAmount":5018,"locationId":"6878b41b196a673840ea4684","createdBy":"689093c0c7d1edb058a9bc6e","_id":"6895d56ae19af16dc17d31a5","createdAt":"2025-08-08T10:46:02.254Z","updatedAt":"2025-08-08T10:46:02.255Z","stockId":"STO-202508-0007","__v":0},"products":[{"productId":"688afa8eddabee25ef1cdfc0","name":"Snacks","qty":2,"amount":5000,"tax1":1,"tax2":1,"tax1Amt":9,"tax2Amt":9,"total":5018,"stockId":"6895d56ae19af16dc17d31a5","locationId":"6878b41b196a673840ea4684","createdBy":"689093c0c7d1edb058a9bc6e"}]}

class SaveStockInModel {
  SaveStockInModel({
    bool? success,
    Data? data,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _data = data;
  }

  SaveStockInModel.fromJson(dynamic json) {
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
  SaveStockInModel copyWith({
    bool? success,
    Data? data,
  }) =>
      SaveStockInModel(
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

/// stock : {"date":"2025-07-31T00:00:00.000Z","supplierId":"687a34e9dd6c1943769b0295","taxType":"exclusive","subTotal":5000,"taxTotal":18,"finalAmount":5018,"locationId":"6878b41b196a673840ea4684","createdBy":"689093c0c7d1edb058a9bc6e","_id":"6895d56ae19af16dc17d31a5","createdAt":"2025-08-08T10:46:02.254Z","updatedAt":"2025-08-08T10:46:02.255Z","stockId":"STO-202508-0007","__v":0}
/// products : [{"productId":"688afa8eddabee25ef1cdfc0","name":"Snacks","qty":2,"amount":5000,"tax1":1,"tax2":1,"tax1Amt":9,"tax2Amt":9,"total":5018,"stockId":"6895d56ae19af16dc17d31a5","locationId":"6878b41b196a673840ea4684","createdBy":"689093c0c7d1edb058a9bc6e"}]

class Data {
  Data({
    Stock? stock,
    List<Products>? products,
  }) {
    _stock = stock;
    _products = products;
  }

  Data.fromJson(dynamic json) {
    _stock = json['stock'] != null ? Stock.fromJson(json['stock']) : null;
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  Stock? _stock;
  List<Products>? _products;
  Data copyWith({
    Stock? stock,
    List<Products>? products,
  }) =>
      Data(
        stock: stock ?? _stock,
        products: products ?? _products,
      );
  Stock? get stock => _stock;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_stock != null) {
      map['stock'] = _stock?.toJson();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// productId : "688afa8eddabee25ef1cdfc0"
/// name : "Snacks"
/// qty : 2
/// amount : 5000
/// tax1 : 1
/// tax2 : 1
/// tax1Amt : 9
/// tax2Amt : 9
/// total : 5018
/// stockId : "6895d56ae19af16dc17d31a5"
/// locationId : "6878b41b196a673840ea4684"
/// createdBy : "689093c0c7d1edb058a9bc6e"

class Products {
  Products({
    String? productId,
    String? name,
    num? qty,
    num? amount,
    num? tax1,
    num? tax2,
    num? tax1Amt,
    num? tax2Amt,
    num? total,
    String? stockId,
    String? locationId,
    String? createdBy,
  }) {
    _productId = productId;
    _name = name;
    _qty = qty;
    _amount = amount;
    _tax1 = tax1;
    _tax2 = tax2;
    _tax1Amt = tax1Amt;
    _tax2Amt = tax2Amt;
    _total = total;
    _stockId = stockId;
    _locationId = locationId;
    _createdBy = createdBy;
  }

  Products.fromJson(dynamic json) {
    _productId = json['productId'];
    _name = json['name'];
    _qty = json['qty'];
    _amount = json['amount'];
    _tax1 = json['tax1'];
    _tax2 = json['tax2'];
    _tax1Amt = json['tax1Amt'];
    _tax2Amt = json['tax2Amt'];
    _total = json['total'];
    _stockId = json['stockId'];
    _locationId = json['locationId'];
    _createdBy = json['createdBy'];
  }
  String? _productId;
  String? _name;
  num? _qty;
  num? _amount;
  num? _tax1;
  num? _tax2;
  num? _tax1Amt;
  num? _tax2Amt;
  num? _total;
  String? _stockId;
  String? _locationId;
  String? _createdBy;
  Products copyWith({
    String? productId,
    String? name,
    num? qty,
    num? amount,
    num? tax1,
    num? tax2,
    num? tax1Amt,
    num? tax2Amt,
    num? total,
    String? stockId,
    String? locationId,
    String? createdBy,
  }) =>
      Products(
        productId: productId ?? _productId,
        name: name ?? _name,
        qty: qty ?? _qty,
        amount: amount ?? _amount,
        tax1: tax1 ?? _tax1,
        tax2: tax2 ?? _tax2,
        tax1Amt: tax1Amt ?? _tax1Amt,
        tax2Amt: tax2Amt ?? _tax2Amt,
        total: total ?? _total,
        stockId: stockId ?? _stockId,
        locationId: locationId ?? _locationId,
        createdBy: createdBy ?? _createdBy,
      );
  String? get productId => _productId;
  String? get name => _name;
  num? get qty => _qty;
  num? get amount => _amount;
  num? get tax1 => _tax1;
  num? get tax2 => _tax2;
  num? get tax1Amt => _tax1Amt;
  num? get tax2Amt => _tax2Amt;
  num? get total => _total;
  String? get stockId => _stockId;
  String? get locationId => _locationId;
  String? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['name'] = _name;
    map['qty'] = _qty;
    map['amount'] = _amount;
    map['tax1'] = _tax1;
    map['tax2'] = _tax2;
    map['tax1Amt'] = _tax1Amt;
    map['tax2Amt'] = _tax2Amt;
    map['total'] = _total;
    map['stockId'] = _stockId;
    map['locationId'] = _locationId;
    map['createdBy'] = _createdBy;
    return map;
  }
}

/// date : "2025-07-31T00:00:00.000Z"
/// supplierId : "687a34e9dd6c1943769b0295"
/// taxType : "exclusive"
/// subTotal : 5000
/// taxTotal : 18
/// finalAmount : 5018
/// locationId : "6878b41b196a673840ea4684"
/// createdBy : "689093c0c7d1edb058a9bc6e"
/// _id : "6895d56ae19af16dc17d31a5"
/// createdAt : "2025-08-08T10:46:02.254Z"
/// updatedAt : "2025-08-08T10:46:02.255Z"
/// stockId : "STO-202508-0007"
/// __v : 0

class Stock {
  Stock({
    String? date,
    String? supplierId,
    String? taxType,
    num? subTotal,
    num? taxTotal,
    num? finalAmount,
    String? locationId,
    String? createdBy,
    String? id,
    String? createdAt,
    String? updatedAt,
    String? stockId,
    num? v,
  }) {
    _date = date;
    _supplierId = supplierId;
    _taxType = taxType;
    _subTotal = subTotal;
    _taxTotal = taxTotal;
    _finalAmount = finalAmount;
    _locationId = locationId;
    _createdBy = createdBy;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _stockId = stockId;
    _v = v;
  }

  Stock.fromJson(dynamic json) {
    _date = json['date'];
    _supplierId = json['supplierId'];
    _taxType = json['taxType'];
    _subTotal = json['subTotal'];
    _taxTotal = json['taxTotal'];
    _finalAmount = json['finalAmount'];
    _locationId = json['locationId'];
    _createdBy = json['createdBy'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _stockId = json['stockId'];
    _v = json['__v'];
  }
  String? _date;
  String? _supplierId;
  String? _taxType;
  num? _subTotal;
  num? _taxTotal;
  num? _finalAmount;
  String? _locationId;
  String? _createdBy;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  String? _stockId;
  num? _v;
  Stock copyWith({
    String? date,
    String? supplierId,
    String? taxType,
    num? subTotal,
    num? taxTotal,
    num? finalAmount,
    String? locationId,
    String? createdBy,
    String? id,
    String? createdAt,
    String? updatedAt,
    String? stockId,
    num? v,
  }) =>
      Stock(
        date: date ?? _date,
        supplierId: supplierId ?? _supplierId,
        taxType: taxType ?? _taxType,
        subTotal: subTotal ?? _subTotal,
        taxTotal: taxTotal ?? _taxTotal,
        finalAmount: finalAmount ?? _finalAmount,
        locationId: locationId ?? _locationId,
        createdBy: createdBy ?? _createdBy,
        id: id ?? _id,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        stockId: stockId ?? _stockId,
        v: v ?? _v,
      );
  String? get date => _date;
  String? get supplierId => _supplierId;
  String? get taxType => _taxType;
  num? get subTotal => _subTotal;
  num? get taxTotal => _taxTotal;
  num? get finalAmount => _finalAmount;
  String? get locationId => _locationId;
  String? get createdBy => _createdBy;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get stockId => _stockId;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['supplierId'] = _supplierId;
    map['taxType'] = _taxType;
    map['subTotal'] = _subTotal;
    map['taxTotal'] = _taxTotal;
    map['finalAmount'] = _finalAmount;
    map['locationId'] = _locationId;
    map['createdBy'] = _createdBy;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['stockId'] = _stockId;
    map['__v'] = _v;
    return map;
  }
}
