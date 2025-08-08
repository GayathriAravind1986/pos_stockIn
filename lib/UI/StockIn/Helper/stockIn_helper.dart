import 'package:intl/intl.dart';
import 'package:simple/UI/StockIn/widget/productModel.dart';

Map<String, dynamic> buildStockInPayload({
  required DateTime date,
  required String supplierId,
  required String taxType,
  required String locationId,
  required List<ProductRowModel> products,
  required double finalAmount,
  required double subtotal,
  required double taxAmount,
  required double totalAmount,
}) {
  return {
    "date": DateFormat('yyyy-MM-dd').format(date),
    "supplierId": supplierId,
    "taxType": taxType.toLowerCase(), // "exclusive" or "inclusive"
    "locationId": locationId,
    "products": products.map((p) {
      return {
        "productId": p.id,
        "name": p.name,
        "qty": p.qty,
        "amount": p.amount,
        "tax1": p.tax1,
        "tax2": p.tax2,
        "tax1Amt": p.tax1Amount,
        "tax2Amt": p.tax2Amount,
        "total": p.total,
      };
    }).toList(),
    "finalAmount": finalAmount,
    "subtotal": subtotal,
    "taxAmount": taxAmount,
    "totalAmount": totalAmount,
  };
}
