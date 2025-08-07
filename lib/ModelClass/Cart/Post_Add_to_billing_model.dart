import 'package:simple/Bloc/Response/errorResponse.dart';

/// items : [{"name":"Apple juice","qty":1,"basePrice":120,"addonTotal":0,"subtotal":120,"totalTax":21.6,"total":141.6,"appliedTaxes":[{"name":"CGST","percentage":9,"amount":10.8,"isInclusive":false},{"name":"SGST","percentage":9,"amount":10.8,"isInclusive":false}]}]
/// subtotal : 240
/// totalTax : 43.2
/// total : 283.2

class PostAddToBillingModel {
  PostAddToBillingModel({
    List<Items>? items,
    num? subtotal,
    num? totalDiscount,
    num? totalTax,
    num? total,
    DiscountSummary? discountSummary,
    ErrorResponse? errorResponse,
  }) {
    _items = items;
    _subtotal = subtotal;
    _totalDiscount = totalDiscount;
    _totalTax = totalTax;
    _total = total;
    _discountSummary = discountSummary;
  }

  PostAddToBillingModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _subtotal = json['subtotal'];
    _totalDiscount = json['totalDiscount'];
    _totalTax = json['totalTax'];
    _total = json['total'];
    _discountSummary = json['discountSummary'] != null
        ? DiscountSummary.fromJson(json['discountSummary'])
        : null;
    if (json['errors'] != null && json['errors'] is Map<String, dynamic>) {
      errorResponse = ErrorResponse.fromJson(json['errors']);
    } else {
      errorResponse = null;
    }
  }
  List<Items>? _items;
  num? _subtotal;
  num? _totalDiscount;
  num? _totalTax;
  num? _total;
  DiscountSummary? _discountSummary;
  ErrorResponse? errorResponse;
  PostAddToBillingModel copyWith({
    List<Items>? items,
    num? subtotal,
    num? totalDiscount,
    num? totalTax,
    num? total,
    DiscountSummary? discountSummary,
  }) =>
      PostAddToBillingModel(
        items: items ?? _items,
        subtotal: subtotal ?? _subtotal,
        totalDiscount: totalDiscount ?? _totalDiscount,
        totalTax: totalTax ?? _totalTax,
        total: total ?? _total,
        discountSummary: discountSummary ?? _discountSummary,
      );
  List<Items>? get items => _items;
  num? get subtotal => _subtotal;
  num? get totalDiscount => _totalDiscount;
  num? get totalTax => _totalTax;
  num? get total => _total;
  DiscountSummary? get discountSummary => _discountSummary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['subtotal'] = _subtotal;
    map['totalDiscount'] = _totalDiscount;
    map['totalTax'] = _totalTax;
    map['total'] = _total;
    if (_discountSummary != null) {
      map['discountSummary'] = _discountSummary?.toJson();
    }
    if (errorResponse != null) {
      map['errors'] = errorResponse!.toJson();
    }
    return map;
  }
}

/// name : "Apple juice"
/// qty : 1
/// basePrice : 120
/// addonTotal : 0
/// subtotal : 120
/// totalTax : 21.6
/// total : 141.6
/// appliedTaxes : [{"name":"CGST","percentage":9,"amount":10.8,"isInclusive":false},{"name":"SGST","percentage":9,"amount":10.8,"isInclusive":false}]
/// hasAddons : false // Added this property
/// addons : [] // Added this property
class DiscountSummary {
  DiscountSummary({
    num? totalDiscountsApplied,
    num? totalDiscountAmount,
    num? averageDiscountPerItem,
  }) {
    _totalDiscountsApplied = totalDiscountsApplied;
    _totalDiscountAmount = totalDiscountAmount;
    _averageDiscountPerItem = averageDiscountPerItem;
  }

  DiscountSummary.fromJson(dynamic json) {
    _totalDiscountsApplied = json['totalDiscountsApplied'];
    _totalDiscountAmount = json['totalDiscountAmount'];
    _averageDiscountPerItem = json['averageDiscountPerItem'];
  }
  num? _totalDiscountsApplied;
  num? _totalDiscountAmount;
  num? _averageDiscountPerItem;
  DiscountSummary copyWith({
    num? totalDiscountsApplied,
    num? totalDiscountAmount,
    num? averageDiscountPerItem,
  }) =>
      DiscountSummary(
        totalDiscountsApplied: totalDiscountsApplied ?? _totalDiscountsApplied,
        totalDiscountAmount: totalDiscountAmount ?? _totalDiscountAmount,
        averageDiscountPerItem:
            averageDiscountPerItem ?? _averageDiscountPerItem,
      );
  num? get totalDiscountsApplied => _totalDiscountsApplied;
  num? get totalDiscountAmount => _totalDiscountAmount;
  num? get averageDiscountPerItem => _averageDiscountPerItem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalDiscountsApplied'] = _totalDiscountsApplied;
    map['totalDiscountAmount'] = _totalDiscountAmount;
    map['averageDiscountPerItem'] = _averageDiscountPerItem;
    return map;
  }
}

class Items {
  Items({
    String? id,
    String? name,
    num? qty,
    num? availableQuantity,
    String? image,
    num? basePrice,
    num? addonTotal,
    List<SelectedAddons>? selectedAddons,
    num? subtotal,
    num? discountAmount,
    dynamic appliedDiscount,
    num? availableDiscounts,
    num? totalTax,
    num? total,
    List<AppliedTaxes>? appliedTaxes,
  }) {
    _id = id;
    _name = name;
    _qty = qty;
    _availableQuantity = availableQuantity;
    _image = image;
    _basePrice = basePrice;
    _addonTotal = addonTotal;
    _selectedAddons = selectedAddons;
    _subtotal = subtotal;
    _discountAmount = discountAmount;
    _appliedDiscount = appliedDiscount;
    _availableDiscounts = availableDiscounts;
    _totalTax = totalTax;
    _total = total;
    _appliedTaxes = appliedTaxes;
  }

  Items.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _qty = json['qty'];
    _availableQuantity = json['availableQuantity'];
    _image = json['image'];
    _basePrice = json['basePrice'];
    _addonTotal = json['addonTotal'];
    if (json['selectedAddons'] != null) {
      _selectedAddons = [];
      json['selectedAddons'].forEach((v) {
        _selectedAddons?.add(SelectedAddons.fromJson(v));
      });
    }
    _subtotal = json['subtotal'];
    _discountAmount = json['discountAmount'];
    _appliedDiscount = json['appliedDiscount'];
    _availableDiscounts = json['availableDiscounts'];
    _totalTax = json['totalTax'];
    _total = json['total'];
    if (json['appliedTaxes'] != null) {
      _appliedTaxes = [];
      json['appliedTaxes'].forEach((v) {
        _appliedTaxes?.add(AppliedTaxes.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  num? _qty;
  num? _availableQuantity;
  String? _image;
  num? _basePrice;
  num? _addonTotal;
  List<SelectedAddons>? _selectedAddons;
  num? _subtotal;
  num? _discountAmount;
  dynamic _appliedDiscount;
  num? _availableDiscounts;
  num? _totalTax;
  num? _total;
  List<AppliedTaxes>? _appliedTaxes;
  Items copyWith({
    String? id,
    String? name,
    num? qty,
    num? availableQuantity,
    String? image,
    num? basePrice,
    num? addonTotal,
    List<SelectedAddons>? selectedAddons,
    num? subtotal,
    num? discountAmount,
    dynamic appliedDiscount,
    num? availableDiscounts,
    num? totalTax,
    num? total,
    List<AppliedTaxes>? appliedTaxes,
  }) =>
      Items(
        id: id ?? _id,
        name: name ?? _name,
        qty: qty ?? _qty,
        availableQuantity: availableQuantity ?? _availableQuantity,
        image: image ?? _image,
        basePrice: basePrice ?? _basePrice,
        addonTotal: addonTotal ?? _addonTotal,
        selectedAddons: selectedAddons ?? _selectedAddons,
        subtotal: subtotal ?? _subtotal,
        discountAmount: discountAmount ?? _discountAmount,
        appliedDiscount: appliedDiscount ?? _appliedDiscount,
        availableDiscounts: availableDiscounts ?? _availableDiscounts,
        totalTax: totalTax ?? _totalTax,
        total: total ?? _total,
        appliedTaxes: appliedTaxes ?? _appliedTaxes,
      );
  String? get id => _id;
  String? get name => _name;
  num? get qty => _qty;
  num? get availableQuantity => _availableQuantity;
  String? get image => _image;
  num? get basePrice => _basePrice;
  num? get addonTotal => _addonTotal;
  List<SelectedAddons>? get selectedAddons => _selectedAddons;
  num? get subtotal => _subtotal;
  num? get discountAmount => _discountAmount;
  dynamic get appliedDiscount => _appliedDiscount;
  num? get availableDiscounts => _availableDiscounts;
  num? get totalTax => _totalTax;
  num? get total => _total;
  List<AppliedTaxes>? get appliedTaxes => _appliedTaxes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['qty'] = _qty;
    map['availableQuantity'] = _availableQuantity;
    map['image'] = _image;
    map['basePrice'] = _basePrice;
    map['addonTotal'] = _addonTotal;
    if (_selectedAddons != null) {
      map['selectedAddons'] = _selectedAddons?.map((v) => v.toJson()).toList();
    }
    map['subtotal'] = _subtotal;
    map['discountAmount'] = _discountAmount;
    map['appliedDiscount'] = _appliedDiscount;
    map['availableDiscounts'] = _availableDiscounts;
    map['totalTax'] = _totalTax;
    map['total'] = _total;
    if (_appliedTaxes != null) {
      map['appliedTaxes'] = _appliedTaxes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "SCGST"
/// percentage : 9
/// amount : 9.92
/// isInclusive : true

class AppliedTaxes {
  AppliedTaxes({
    String? name,
    num? percentage,
    num? amount,
    bool? isInclusive,
  }) {
    _name = name;
    _percentage = percentage;
    _amount = amount;
    _isInclusive = isInclusive;
  }

  AppliedTaxes.fromJson(dynamic json) {
    _name = json['name'];
    _percentage = json['percentage'];
    _amount = json['amount'];
    _isInclusive = json['isInclusive'];
  }
  String? _name;
  num? _percentage;
  num? _amount;
  bool? _isInclusive;
  AppliedTaxes copyWith({
    String? name,
    num? percentage,
    num? amount,
    bool? isInclusive,
  }) =>
      AppliedTaxes(
        name: name ?? _name,
        percentage: percentage ?? _percentage,
        amount: amount ?? _amount,
        isInclusive: isInclusive ?? _isInclusive,
      );
  String? get name => _name;
  num? get percentage => _percentage;
  num? get amount => _amount;
  bool? get isInclusive => _isInclusive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['percentage'] = _percentage;
    map['amount'] = _amount;
    map['isInclusive'] = _isInclusive;
    return map;
  }
}

/// _id : "68763b27ff518ce12520c915"
/// name : "Extra creams"
/// price : 30
/// quantity : 1
/// isFree : false
/// isAvailable : true
/// total : 30

class SelectedAddons {
  SelectedAddons({
    String? id,
    String? name,
    num? price,
    bool? isSelected,
    num? quantity,
    bool? isFree,
    bool? isAvailable,
    num? total,
    num? qty,
  }) {
    _id = id;
    _name = name;
    _price = price;
    _isSelected = isSelected;
    _quantity = quantity;
    _isFree = isFree;
    _isAvailable = isAvailable;
    _total = total;
    _qty = qty ?? 0;
  }

  SelectedAddons.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _price = json['price'];
    _isSelected = json['isSelected'];
    _quantity = json['quantity'];
    _isFree = json['isFree'];
    _isAvailable = json['isAvailable'];
    _total = json['total'];
    _qty = json['qty'] ?? 0;
  }
  String? _id;
  String? _name;
  num? _price;
  bool? _isSelected;
  num? _quantity;
  bool? _isFree;
  bool? _isAvailable;
  num? _total;
  num? _qty;
  num get qty => _qty ?? 0;
  set qty(num value) => _qty = value;

  SelectedAddons copyWith({
    String? id,
    String? name,
    num? price,
    bool? isSelected,
    num? quantity,
    bool? isFree,
    bool? isAvailable,
    num? total,
    num? qty,
  }) =>
      SelectedAddons(
        id: id ?? _id,
        name: name ?? _name,
        price: price ?? _price,
        quantity: quantity ?? _quantity,
        isFree: isFree ?? _isFree,
        isAvailable: isAvailable ?? _isAvailable,
        total: total ?? _total,
      );
  String? get id => _id;
  String? get name => _name;
  num? get price => _price;
  bool? get isSelected => _isSelected;
  num? get quantity => _quantity;
  bool? get isFree => _isFree;
  bool? get isAvailable => _isAvailable;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['isSelected'] = _isSelected;
    map['quantity'] = _quantity;
    map['isFree'] = _isFree;
    map['isAvailable'] = _isAvailable;
    map['total'] = _total;
    map['qty'] = _qty;
    return map;
  }
}
