import 'package:simple/Bloc/Response/errorResponse.dart';

/// success : true
/// rows : [{"_id":"685579649330a7ce88e92838","name":"Black Forest","category":{"_id":"685541db400f8fb4c8c8c7ee","name":"Cakes","isAvailable":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826817/categories/grxwq0v6cxzaqi4kp2up.jpg"},"basePrice":75,"hasAddons":true,"isAvailable":true,"createdBy":"6852f46f0ccccfaec54776cc","createdAt":"2025-06-20T15:08:20.350Z","updatedAt":"2025-07-07T14:25:35.097Z","__v":0,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826868/products/sw53luofnaposs603yv4.jpg","addons":[{"_id":"685d048f11d74caf4073f8d6","name":"Cream powder","maxQuantity":1,"price":20,"isAvailable":true,"isFree":false,"products":["685579649330a7ce88e92838","685b7f8f8753e2ece10465df","685b7fa98753e2ece10465e7"]}]},{"_id":"685b7f8f8753e2ece10465df","name":"Red velvet","category":{"_id":"685541db400f8fb4c8c8c7ee","name":"Cakes","isAvailable":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826817/categories/grxwq0v6cxzaqi4kp2up.jpg"},"basePrice":100,"hasAddons":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826895/products/plfepz8r4nbe0xn3oqez.jpg","isAvailable":true,"createdBy":"6852f46f0ccccfaec54776cc","createdAt":"2025-06-25T04:48:15.772Z","updatedAt":"2025-06-26T05:54:23.181Z","__v":0,"addons":[{"_id":"685d048f11d74caf4073f8d6","name":"Cream powder","maxQuantity":1,"price":20,"isAvailable":true,"isFree":false,"products":["685579649330a7ce88e92838","685b7f8f8753e2ece10465df","685b7fa98753e2ece10465e7"]}]},{"_id":"685b7fa98753e2ece10465e7","name":"White forest","category":{"_id":"685541db400f8fb4c8c8c7ee","name":"Cakes","isAvailable":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826817/categories/grxwq0v6cxzaqi4kp2up.jpg"},"basePrice":60,"hasAddons":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826921/products/lxjmbmzie0wbnczf3afi.jpg","isAvailable":true,"createdBy":"6852f46f0ccccfaec54776cc","createdAt":"2025-06-25T04:48:41.520Z","updatedAt":"2025-06-25T04:48:41.520Z","__v":0,"addons":[{"_id":"685d048f11d74caf4073f8d6","name":"Cream powder","maxQuantity":1,"price":20,"isAvailable":true,"isFree":false,"products":["685579649330a7ce88e92838","685b7f8f8753e2ece10465df","685b7fa98753e2ece10465e7"]}]}]
/// count : 3

class GetProductByCatIdModel {
  GetProductByCatIdModel({
    bool? success,
    List<Rows>? rows,
    num? count,
    bool? stockMaintenance,
    ErrorResponse? errorResponse,
  }) {
    _success = success;
    _rows = rows;
    _count = count;
    _stockMaintenance = stockMaintenance;
  }

  GetProductByCatIdModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(Rows.fromJson(v));
      });
    }
    _count = json['count'];
    _stockMaintenance = json['stockMaintenance'];
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  bool? _success;
  List<Rows>? _rows;
  num? _count;
  bool? _stockMaintenance;
  ErrorResponse? errorResponse;
  GetProductByCatIdModel copyWith({
    bool? success,
    List<Rows>? rows,
    num? count,
    bool? stockMaintenance,
  }) =>
      GetProductByCatIdModel(
        success: success ?? _success,
        rows: rows ?? _rows,
        count: count ?? _count,
        stockMaintenance: stockMaintenance ?? _stockMaintenance,
      );
  bool? get success => _success;
  List<Rows>? get rows => _rows;
  num? get count => _count;
  bool? get stockMaintenance => _stockMaintenance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_rows != null) {
      map['rows'] = _rows?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    map['stockMaintenance'] = _stockMaintenance;
    if (errorResponse != null) {
      map['errors'] = errorResponse!.toJson();
    }
    return map;
  }
}

/// _id : "685579649330a7ce88e92838"
/// name : "Black Forest"
/// category : {"_id":"685541db400f8fb4c8c8c7ee","name":"Cakes","isAvailable":true,"image":"https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826817/categories/grxwq0v6cxzaqi4kp2up.jpg"}
/// basePrice : 75
/// hasAddons : true
/// isAvailable : true
/// createdBy : "6852f46f0ccccfaec54776cc"
/// createdAt : "2025-06-20T15:08:20.350Z"
/// updatedAt : "2025-07-07T14:25:35.097Z"
/// __v : 0
/// image : "https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826868/products/sw53luofnaposs603yv4.jpg"
/// addons : [{"_id":"685d048f11d74caf4073f8d6","name":"Cream powder","maxQuantity":1,"price":20,"isAvailable":true,"isFree":false,"products":["685579649330a7ce88e92838","685b7f8f8753e2ece10465df","685b7fa98753e2ece10465e7"]}]

class Rows {
  int counter;
  Rows({
    this.counter = 0,
    String? id,
    String? name,
    Category? category,
    num? basePrice,
    bool? hasAddons,
    bool? isAvailable,
    bool? dailyStockClear,
    bool? isDefault,
    LocationId? locationId,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? image,
    List<Addons>? addons,
    num? purchaseQuantity,
    num? saleQuantity,
    num? availableQuantity,
    bool? isStock,
  }) {
    _id = id;
    _name = name;
    _category = category;
    _basePrice = basePrice;
    _hasAddons = hasAddons;
    _isAvailable = isAvailable;
    _dailyStockClear = dailyStockClear;
    _isDefault = isDefault;
    _locationId = locationId;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _image = image;
    _addons = addons;
    _purchaseQuantity = purchaseQuantity;
    _saleQuantity = saleQuantity;
    _availableQuantity = availableQuantity;
    _isStock = isStock;
  }

  Rows.fromJson(dynamic json) : counter = 0 {
    _id = json['_id'];
    _name = json['name'];
    _category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    _basePrice = json['basePrice'];
    _hasAddons = json['hasAddons'];
    _isAvailable = json['isAvailable'];
    _dailyStockClear = json['dailyStockClear'];
    _isDefault = json['isDefault'];
    _locationId = json['locationId'] != null
        ? LocationId.fromJson(json['locationId'])
        : null;
    _createdBy = json['createdBy'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _image = json['image'];
    if (json['addons'] != null) {
      _addons = [];
      json['addons'].forEach((v) {
        _addons?.add(Addons.fromJson(v));
      });
    }
    _purchaseQuantity = json['purchaseQuantity'];
    _saleQuantity = json['saleQuantity'];
    _availableQuantity = json['availableQuantity'];
    _isStock = json['isStock'];
  }
  String? _id;
  String? _name;
  Category? _category;
  num? _basePrice;
  bool? _hasAddons;
  bool? _isAvailable;
  bool? _dailyStockClear;
  bool? _isDefault;
  LocationId? _locationId;
  String? _createdBy;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _image;
  List<Addons>? _addons;
  num? _purchaseQuantity;
  num? _saleQuantity;
  num? _availableQuantity;
  bool? _isStock;
  Rows copyWith({
    String? id,
    String? name,
    Category? category,
    num? basePrice,
    bool? hasAddons,
    bool? isAvailable,
    bool? dailyStockClear,
    bool? isDefault,
    LocationId? locationId,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? image,
    List<Addons>? addons,
    num? purchaseQuantity,
    num? saleQuantity,
    num? availableQuantity,
    bool? isStock,
  }) =>
      Rows(
        id: id ?? _id,
        name: name ?? _name,
        category: category ?? _category,
        basePrice: basePrice ?? _basePrice,
        hasAddons: hasAddons ?? _hasAddons,
        isAvailable: isAvailable ?? _isAvailable,
        dailyStockClear: dailyStockClear ?? _dailyStockClear,
        isDefault: isDefault ?? _isDefault,
        locationId: locationId ?? _locationId,
        createdBy: createdBy ?? _createdBy,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
        image: image ?? _image,
        addons: addons ?? _addons,
        purchaseQuantity: purchaseQuantity ?? _purchaseQuantity,
        saleQuantity: saleQuantity ?? _saleQuantity,
        availableQuantity: availableQuantity ?? _availableQuantity,
        isStock: isStock ?? _isStock,
      );
  String? get id => _id;
  String? get name => _name;
  Category? get category => _category;
  num? get basePrice => _basePrice;
  bool? get hasAddons => _hasAddons;
  bool? get isAvailable => _isAvailable;
  bool? get dailyStockClear => _dailyStockClear;
  bool? get isDefault => _isDefault;
  LocationId? get locationId => _locationId;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  String? get image => _image;
  List<Addons>? get addons => _addons;
  num? get purchaseQuantity => _purchaseQuantity;
  num? get saleQuantity => _saleQuantity;
  num? get availableQuantity => _availableQuantity;
  bool? get isStock => _isStock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['counter'] = counter;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['basePrice'] = _basePrice;
    map['hasAddons'] = _hasAddons;
    map['isAvailable'] = _isAvailable;
    map['dailyStockClear'] = _dailyStockClear;
    map['isDefault'] = _isDefault;
    if (_locationId != null) {
      map['locationId'] = _locationId?.toJson();
    }
    map['createdBy'] = _createdBy;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['image'] = _image;
    if (_addons != null) {
      map['addons'] = _addons?.map((v) => v.toJson()).toList();
    }
    map['purchaseQuantity'] = _purchaseQuantity;
    map['saleQuantity'] = _saleQuantity;
    map['availableQuantity'] = _availableQuantity;
    map['isStock'] = _isStock;
    return map;
  }
}

/// _id : "685d048f11d74caf4073f8d6"
/// name : "Cream powder"
/// maxQuantity : 1
/// price : 20
/// isAvailable : true
/// isFree : false
/// products : ["685579649330a7ce88e92838","685b7f8f8753e2ece10465df","685b7fa98753e2ece10465e7"]

class Addons {
  Addons({
    String? id,
    String? name,
    num? maxQuantity,
    num? price,
    bool? isAvailable,
    bool? isFree,
    List<String>? products,
    this.isSelected = false,
    num? quantity,
  }) {
    _id = id;
    _name = name;
    _maxQuantity = maxQuantity;
    _price = price;
    _isAvailable = isAvailable;
    _isFree = isFree;
    _products = products;
    _quantity = quantity ?? 0;
  }

  Addons.fromJson(dynamic json) : isSelected = false {
    _id = json['_id'];
    _name = json['name'];
    _maxQuantity = json['maxQuantity'];
    _price = json['price'];
    _isAvailable = json['isAvailable'];
    _isFree = json['isFree'];
    _products = json['products'] != null ? json['products'].cast<String>() : [];
    _quantity = json['quantity'] ?? 0;
  }

  String? _id;
  String? _name;
  num? _maxQuantity;
  num? _price;
  bool? _isAvailable;
  bool? _isFree;
  List<String>? _products;
  num? _quantity; // ✅ private quantity field added

  bool isSelected;

  // ✅ Getter and Setter
  num get quantity => _quantity ?? 0;
  set quantity(num value) => _quantity = value;

  Addons copyWith({
    String? id,
    String? name,
    num? maxQuantity,
    num? price,
    bool? isAvailable,
    bool? isFree,
    List<String>? products,
    bool? isSelected,
    num? quantity,
  }) =>
      Addons(
        id: id ?? _id,
        name: name ?? _name,
        maxQuantity: maxQuantity ?? _maxQuantity,
        price: price ?? _price,
        isAvailable: isAvailable ?? _isAvailable,
        isFree: isFree ?? _isFree,
        products: products ?? _products,
        isSelected: isSelected ?? this.isSelected,
        quantity: quantity ?? _quantity,
      );

  // ✅ Public getters
  String? get id => _id;
  String? get name => _name;
  num? get maxQuantity => _maxQuantity;
  num? get price => _price;
  bool? get isAvailable => _isAvailable;
  bool? get isFree => _isFree;
  List<String>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['maxQuantity'] = _maxQuantity;
    map['price'] = _price;
    map['isAvailable'] = _isAvailable;
    map['isFree'] = _isFree;
    map['products'] = _products;
    map['quantity'] = _quantity;
    return map;
  }
}

/// _id : "685541db400f8fb4c8c8c7ee"
/// name : "Cakes"
/// isAvailable : true
/// image : "https://res.cloudinary.com/dm6wrm7vf/image/upload/v1750826817/categories/grxwq0v6cxzaqi4kp2up.jpg"

class Category {
  Category({
    String? id,
    String? name,
    bool? isAvailable,
    String? image,
  }) {
    _id = id;
    _name = name;
    _isAvailable = isAvailable;
    _image = image;
  }

  Category.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _isAvailable = json['isAvailable'];
    _image = json['image'];
  }
  String? _id;
  String? _name;
  bool? _isAvailable;
  String? _image;
  Category copyWith({
    String? id,
    String? name,
    bool? isAvailable,
    String? image,
  }) =>
      Category(
        id: id ?? _id,
        name: name ?? _name,
        isAvailable: isAvailable ?? _isAvailable,
        image: image ?? _image,
      );
  String? get id => _id;
  String? get name => _name;
  bool? get isAvailable => _isAvailable;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['isAvailable'] = _isAvailable;
    map['image'] = _image;
    return map;
  }
}

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
