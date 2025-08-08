import 'package:flutter/material.dart';

class ProductRowModel {
  final String id;
  String name;
  int qty;
  double amount;
  double tax1;
  double tax2;
  double tax1Amount;
  double tax2Amount;
  double total;

  // Add controllers for calculated fields
  late TextEditingController tax1AmountController;
  late TextEditingController tax2AmountController;
  late TextEditingController totalController;

  ProductRowModel({
    required this.id,
    required this.name,
    this.qty = 1,
    this.amount = 0.0,
    this.tax1 = 0.0,
    this.tax2 = 0.0,
    this.tax1Amount = 0.0,
    this.tax2Amount = 0.0,
    this.total = 0.0,
  }) {
    // Initialize controllers with empty string if value is 0.0
    tax1AmountController = TextEditingController(
        text: tax1Amount == 0.0 ? '' : tax1Amount.toStringAsFixed(2));
    tax2AmountController = TextEditingController(
        text: tax2Amount == 0.0 ? '' : tax2Amount.toStringAsFixed(2));
    totalController = TextEditingController(
        text: total == 0.0 ? '' : total.toStringAsFixed(2));
  }

  void updateCalculatedValues() {
    tax1AmountController.text =
        tax1Amount == 0.0 ? '' : tax1Amount.toStringAsFixed(2);
    tax2AmountController.text =
        tax2Amount == 0.0 ? '' : tax2Amount.toStringAsFixed(2);
    totalController.text = total == 0.0 ? '' : total.toStringAsFixed(2);
  }

  void dispose() {
    tax1AmountController.dispose();
    tax2AmountController.dispose();
    totalController.dispose();
  }
}
