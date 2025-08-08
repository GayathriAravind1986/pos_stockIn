import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple/Alertbox/snackBarAlert.dart';
import 'package:simple/Bloc/StockIn/stock_in_bloc.dart';
import 'package:simple/ModelClass/StockIn/getLocationModel.dart';
import 'package:simple/ModelClass/StockIn/getSupplierLocationModel.dart';
import 'package:simple/ModelClass/StockIn/get_add_product_model.dart'
    as productModel;
import 'package:simple/ModelClass/StockIn/saveStockInModel.dart';
import 'package:simple/Reusable/color.dart';
import 'package:simple/Reusable/space.dart';
import 'package:simple/UI/Authentication/login_screen.dart';
import 'package:simple/UI/StockIn/Helper/stockIn_helper.dart';
import 'package:simple/UI/StockIn/widget/productModel.dart';

class StockView extends StatelessWidget {
  final GlobalKey<StockViewViewState>? stockKey;
  bool? hasRefreshedStock;
  StockView({
    super.key,
    this.stockKey,
    this.hasRefreshedStock,
  });

  @override
  Widget build(BuildContext context) {
    return StockViewView(
        stockKey: stockKey, hasRefreshedStock: hasRefreshedStock);
  }
}

class StockViewView extends StatefulWidget {
  final GlobalKey<StockViewViewState>? stockKey;
  bool? hasRefreshedStock;
  StockViewView({
    super.key,
    this.stockKey,
    this.hasRefreshedStock,
  });

  @override
  StockViewViewState createState() => StockViewViewState();
}

class StockViewViewState extends State<StockViewView> {
  GetLocationModel getLocationModel = GetLocationModel();
  GetSupplierLocationModel getSupplierLocationModel =
      GetSupplierLocationModel();
  productModel.GetAddProductModel getAddProductModel =
      productModel.GetAddProductModel();
  SaveStockInModel saveStockInModel = SaveStockInModel();

  Key productDropdownKey = UniqueKey();

  String? errorMessage;
  bool stockLoad = false;
  bool saveLoad = false;
  DateTime selectedDate = DateTime.now();
  String? selectedLocation;
  String? selectedSupplier;
  String? selectedTax;
  String? selectedProduct;
  String? locationId;

  final TextEditingController subtotalController =
      TextEditingController(text: '0.00');
  final TextEditingController taxController =
      TextEditingController(text: '0.00');
  final TextEditingController totalController =
      TextEditingController(text: '0.00');
  final TextEditingController finalController =
      TextEditingController(text: '0.00');
  productModel.Data? selectedProductObj;
  List<ProductRowModel> selectedProducts = [];
  bool _isProductAlreadyAdded(String productId) {
    return selectedProducts.any((product) => product.id == productId);
  }

  final List<String> taxType = ['Inclusive', 'Exclusive'];
  void refreshStock() {
    if (!mounted || !context.mounted) return;
    context.read<StockInBloc>().add(StockInLocation());
    setState(() {
      stockLoad = true;
    });
  }

  void calculateTotals() {
    double subtotal = 0.0;
    double tax1Total = 0.0;
    double tax2Total = 0.0;
    double grandTotal = 0.0;

    for (var product in selectedProducts) {
      double lineSubtotal;

      if (selectedTax == 'Inclusive') {
        // Convert percentage to decimal (0.2% = 0.002, 0.3% = 0.003)
        double tax1Decimal = product.tax1 / 100;
        double tax2Decimal = product.tax2 / 100;
        double totalTaxPercent = tax1Decimal + tax2Decimal;

        double totalAmount = product.amount * product.qty;

        // Calculate subtotal (amount without tax)
        lineSubtotal = totalAmount / (1 + totalTaxPercent);

        // Calculate individual tax amounts
        product.tax1Amount = lineSubtotal * tax1Decimal;
        product.tax2Amount = lineSubtotal * tax2Decimal;

        // Total remains the same as entered amount
        product.total = totalAmount;
      } else {
        // Exclusive means tax is added on top of amount
        lineSubtotal = product.amount * product.qty;
        double tax1Decimal = product.tax1 / 100;
        double tax2Decimal = product.tax2 / 100;

        product.tax1Amount = lineSubtotal * tax1Decimal;
        product.tax2Amount = lineSubtotal * tax2Decimal;
        product.total = lineSubtotal + product.tax1Amount + product.tax2Amount;
      }

      subtotal += lineSubtotal;
      tax1Total += product.tax1Amount;
      tax2Total += product.tax2Amount;
      grandTotal += product.total;
    }

    // Set values to controllers
    subtotalController.text = subtotal.toStringAsFixed(2);
    taxController.text = (tax1Total + tax2Total).toStringAsFixed(2);
    totalController.text = grandTotal.toStringAsFixed(2);
    finalController.text = grandTotal.toStringAsFixed(2);
  }

  void clearStockInForm() {
    setState(() {
      selectedSupplier = null;
      selectedTax = null;
      selectedProducts.clear();
      selectedProduct = null;
      selectedProductObj = null;
      subtotalController.text = '0.00';
      taxController.text = '0.00';
      totalController.text = '0.00';
      finalController.text = '0.00';
      productDropdownKey = UniqueKey();
    });
  }
/* validation */

  bool showSupplierError = false;
  bool showTaxTypeError = false;
  bool showProductError = false;
  String? supplierErrorText;
  String? taxTypeErrorText;
  String? productErrorText;

  bool validateForm() {
    bool isValid = true;

    setState(() {
      // Reset all error states
      showSupplierError = false;
      showTaxTypeError = false;
      showProductError = false;
      supplierErrorText = null;
      taxTypeErrorText = null;
      productErrorText = null;
    });

    // Validate supplier
    if (selectedSupplier == null || selectedSupplier!.isEmpty) {
      setState(() {
        showSupplierError = true;
        supplierErrorText = 'Supplier is required';
      });
      isValid = false;
    }

    // Validate tax type
    if (selectedTax == null || selectedTax!.isEmpty) {
      setState(() {
        showTaxTypeError = true;
        taxTypeErrorText = 'Tax type is required';
      });
      isValid = false;
    }

    // Validate products
    if (selectedProducts.isEmpty) {
      setState(() {
        showProductError = true;
        productErrorText = 'At least one product is required';
      });
      isValid = false;
    } else {
      // Validate individual product fields
      for (int i = 0; i < selectedProducts.length; i++) {
        ProductRowModel product = selectedProducts[i];

        if (product.qty <= 0) {
          showValidationSnackBar(
              'Product "${product.name}" quantity must be greater than 0');
          isValid = false;
          break;
        }

        if (product.amount <= 0) {
          showValidationSnackBar(
              'Product "${product.name}" amount must be greater than 0');
          isValid = false;
          break;
        }
      }
    }

    // Validate final amount
    double finalAmount = double.tryParse(finalController.text) ?? 0.0;
    if (finalAmount <= 0) {
      showValidationSnackBar('Final amount must be greater than 0');
      isValid = false;
    }

    return isValid;
  }

  // Show validation message using SnackBar
  void showValidationSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.hasRefreshedStock == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.stockKey?.currentState?.refreshStock();
        setState(() {
          stockLoad = true;
        });
      });
    } else {
      context.read<StockInBloc>().add(StockInLocation());
      setState(() {
        stockLoad = true;
      });
    }
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: appPrimaryColor,
              onPrimary: whiteColor,
              onSurface: blackColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    appPrimaryColor, // OK & Cancel button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String getDisplayValue(double value) {
    return value == 0.0 ? '' : value.toStringAsFixed(2);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget buildProductRow(int index, ProductRowModel productRow) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            // Name
            Expanded(
              flex: 2,
              child: TextFormField(
                initialValue: productRow.name,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),

            // Qty
            Expanded(
              child: TextFormField(
                key: ValueKey('qty_$index'),
                initialValue: productRow.qty.toString(),
                onChanged: (val) {
                  setState(() {
                    productRow.qty = int.tryParse(val) ?? 1;
                    calculateTotals();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Qty',
                  labelStyle: TextStyle(color: greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),

            // Amount
            Expanded(
              child: TextFormField(
                key: ValueKey('amount_$index'),
                initialValue: getDisplayValue(productRow.amount),
                onChanged: (val) {
                  setState(() {
                    productRow.amount = double.tryParse(val) ?? 0.0;
                    calculateTotals();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),

            // Tax1 %
            Expanded(
              child: TextFormField(
                key: ValueKey('tax1_$index'),
                initialValue: getDisplayValue(productRow.tax1),
                onChanged: (val) {
                  setState(() {
                    productRow.tax1 = double.tryParse(val) ?? 0.0;
                    calculateTotals();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Tax1%',
                  labelStyle: TextStyle(color: greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),

            // Tax2 %
            Expanded(
              child: TextFormField(
                key: ValueKey('tax2_$index'),
                initialValue: getDisplayValue(productRow.tax2),
                onChanged: (val) {
                  setState(() {
                    productRow.tax2 = double.tryParse(val) ?? 0.0;
                    calculateTotals();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Tax2%',
                  labelStyle: TextStyle(color: greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),

            // Tax1 Amount (read-only)
            Expanded(
              child: TextFormField(
                key: ValueKey(
                    'tax1Amount_${index}_${productRow.tax1Amount}'), // Fixed: removed underscore
                initialValue: productRow.tax1Amount.toStringAsFixed(2),
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Tax1 Amt',
                  labelStyle: TextStyle(color: greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),

            // Tax2 Amount (read-only) - FIXED: Correct key name
            Expanded(
              child: TextFormField(
                key: ValueKey('tax2Amount_${index}_${productRow.tax2Amount}'),
                initialValue: productRow.tax2Amount.toStringAsFixed(2),
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Tax2 Amt',
                  labelStyle: TextStyle(color: greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),

            // Total (read-only) - FIXED: Correct key name
            Expanded(
              child: TextFormField(
                key: ValueKey(
                    'total_${index}_${productRow.total}'), // Fixed: removed underscore
                initialValue: productRow.total.toStringAsFixed(2),
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Total',
                  labelStyle: TextStyle(color: greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),

            // Delete Button
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  selectedProducts.removeAt(index);
                  selectedProduct = null;
                  selectedProductObj = null;
                  productDropdownKey = UniqueKey();
                  calculateTotals();
                });
              },
            ),
          ],
        ),
      );
    }

    Widget mainContainer() {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("Stock In",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              verticalSpace(height: 10),
              Row(
                children: [
                  // Date Picker
                  Expanded(
                    child: GestureDetector(
                      onTap: _pickDate,
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Date',
                            labelStyle: TextStyle(color: appPrimaryColor),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: greyColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appPrimaryColor, width: 2),
                            ),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          controller: TextEditingController(
                            text: DateFormat('dd/MM/yyyy').format(selectedDate),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  getLocationModel.data?.locationName != null
                      ? Expanded(
                          child: TextFormField(
                            enabled: false,
                            initialValue: getLocationModel.data!.locationName!,
                            decoration: InputDecoration(
                              labelText: 'Location',
                              labelStyle: TextStyle(color: appPrimaryColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: greyColor),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: greyColor),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(), // or show a loading indicator
                ],
              ),
              verticalSpace(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Supplier *',
                        labelStyle: TextStyle(
                            color: showSupplierError
                                ? redColor
                                : (selectedSupplier != null
                                    ? appPrimaryColor
                                    : greyColor)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: showSupplierError ? redColor : greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: showSupplierError
                                  ? redColor
                                  : appPrimaryColor,
                              width: 2),
                        ),
                        errorText: showSupplierError ? supplierErrorText : null,
                      ),
                      value: selectedSupplier,
                      items: (getSupplierLocationModel.data ?? [])
                          .map<DropdownMenuItem<String>>(
                              (sup) => DropdownMenuItem<String>(
                                    value: sup.id,
                                    child: Text(sup.name ?? 'No Name'),
                                  ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSupplier = value;
                          showSupplierError = false;
                          supplierErrorText = null;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Tax Type *',
                        labelStyle: TextStyle(
                            color: showTaxTypeError
                                ? redColor
                                : (selectedTax != null
                                    ? appPrimaryColor
                                    : greyColor)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: showTaxTypeError ? redColor : greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  showTaxTypeError ? redColor : appPrimaryColor,
                              width: 2),
                        ),
                        errorText: showTaxTypeError ? taxTypeErrorText : null,
                      ),
                      value: selectedTax,
                      items: taxType
                          .map((tax) => DropdownMenuItem(
                                value: tax,
                                child: Text(tax),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedTax = value;
                          showTaxTypeError = false;
                          taxTypeErrorText = null;
                          calculateTotals();
                        });
                      },
                    ),
                  ),
                ],
              ),
              verticalSpace(height: 10),
              DropdownButtonFormField<String>(
                  key: productDropdownKey,
                  decoration: InputDecoration(
                    hint: const Text("Add Product *"),
                    labelText: 'Add Product *',
                    labelStyle: TextStyle(
                      color: showProductError
                          ? redColor
                          : (selectedProduct != null
                              ? appPrimaryColor
                              : greyColor),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: showProductError ? redColor : greyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: showProductError ? redColor : appPrimaryColor,
                          width: 2),
                    ),
                  ),
                  value: selectedProduct,
                  items: (getAddProductModel.data ?? [])
                      .map<DropdownMenuItem<String>>(
                        (pro) => DropdownMenuItem<String>(
                          value: pro.id,
                          child: Text(pro.name ?? 'No Name'),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      try {
                        selectedProductObj = getAddProductModel.data
                            ?.firstWhere((product) => product.id == value);
                      } on StateError {
                        selectedProduct = null;
                        selectedProductObj = null;
                        productDropdownKey = UniqueKey();
                      }
                      final dropdownItems = (getAddProductModel.data ?? [])
                          .where((pro) => !selectedProducts
                              .any((selected) => selected.id == pro.id))
                          .toList();

                      if (selectedProduct != null &&
                          dropdownItems
                              .every((item) => item.id != selectedProduct)) {
                        selectedProduct = null;
                        selectedProductObj = null;
                        productDropdownKey = UniqueKey();
                      }
                      if (value != null &&
                          selectedProductObj != null &&
                          !_isProductAlreadyAdded(value)) {
                        selectedProducts.add(ProductRowModel(
                          id: selectedProductObj?.id ?? '',
                          name: selectedProductObj?.name ?? 'No Name',
                        ));
                        selectedProduct = null;
                        selectedProductObj = null;
                        productDropdownKey = UniqueKey();
                        showProductError = false;
                        productErrorText = null;
                      } else {
                        selectedProduct = value;
                      }
                      calculateTotals();
                    });
                  }),
              if (showProductError && productErrorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                  child: Text(
                    productErrorText!,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              SizedBox(height: 16),
              if (selectedProducts.isNotEmpty)
                Column(
                  children: selectedProducts
                      .asMap()
                      .entries
                      .map((entry) => buildProductRow(entry.key, entry.value))
                      .toList(),
                ),
              verticalSpace(height: 15),
              Row(
                children: [
                  // Subtotal
                  Expanded(
                    child: TextFormField(
                      controller: subtotalController,
                      decoration: InputDecoration(
                        labelText: 'Subtotal',
                        labelStyle: TextStyle(color: appPrimaryColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: appPrimaryColor, width: 2),
                        ),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  SizedBox(width: 12),
                  // Tax Amount
                  Expanded(
                    child: TextFormField(
                      controller: taxController,
                      decoration: InputDecoration(
                        labelText: 'Tax Amount',
                        labelStyle: TextStyle(color: appPrimaryColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: appPrimaryColor, width: 2),
                        ),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  SizedBox(width: 12),
                  // Total Amount
                  Expanded(
                    child: TextFormField(
                      controller: totalController,
                      decoration: InputDecoration(
                        labelText: 'Total Amount',
                        labelStyle: TextStyle(color: appPrimaryColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: appPrimaryColor, width: 2),
                        ),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  SizedBox(width: 12),
                  // Final Amount
                  Expanded(
                    child: TextFormField(
                      controller: finalController,
                      decoration: InputDecoration(
                        labelText: 'Final Amount',
                        labelStyle: TextStyle(color: appPrimaryColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: appPrimaryColor, width: 2),
                        ),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                ],
              ),
              verticalSpace(height: size.height * 0.1),
              saveLoad
                  ? SpinKitCircle(color: appPrimaryColor, size: 30)
                  : Center(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          if (!validateForm()) {
                            return; // Stop if validation fails
                          }

                          debugPrint("Validation passed, saving...");
                          setState(() {
                            saveLoad = true;
                          });

                          try {
                            final payload = buildStockInPayload(
                              date: selectedDate,
                              supplierId: selectedSupplier ?? '',
                              taxType: selectedTax ?? '',
                              locationId: getLocationModel.data?.id ?? '',
                              products: selectedProducts,
                              finalAmount:
                                  double.tryParse(finalController.text) ?? 0.0,
                              subtotal:
                                  double.tryParse(subtotalController.text) ??
                                      0.0,
                              taxAmount:
                                  double.tryParse(taxController.text) ?? 0.0,
                              totalAmount:
                                  double.tryParse(totalController.text) ?? 0.0,
                            );

                            debugPrint(
                                "📦 Sending StockIn payload: ${jsonEncode(payload)}");
                            context
                                .read<StockInBloc>()
                                .add(SaveStockIn(jsonEncode(payload)));
                          } catch (e) {
                            setState(() {
                              saveLoad = false;
                            });
                            showValidationSnackBar(
                                'An error occurred while saving: $e');
                          }
                        },
                        label: const Text("Save"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greenColor,
                          foregroundColor: whiteColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          minimumSize: Size(size.width * 0.25, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<StockInBloc, dynamic>(
      buildWhen: ((previous, current) {
        if (current is GetLocationModel) {
          getLocationModel = current;
          if (getLocationModel.errorResponse?.isUnauthorized == true) {
            _handle401Error();
            return true;
          }
          if (getLocationModel.success == true) {
            locationId = getLocationModel.data?.locationId;
            debugPrint("locationId:$locationId");
            context
                .read<StockInBloc>()
                .add(StockInSupplier(locationId.toString()));
            context
                .read<StockInBloc>()
                .add(StockInAddProduct(locationId.toString()));
            setState(() {
              stockLoad = false;
            });
          } else {
            debugPrint("${getLocationModel.data?.locationName}");
            setState(() {
              stockLoad = false;
            });
            showToast("No Location found", context, color: false);
          }
          return true;
        }
        if (current is GetSupplierLocationModel) {
          getSupplierLocationModel = current;
          if (getSupplierLocationModel.errorResponse?.isUnauthorized == true) {
            _handle401Error();
            return true;
          }
          if (getSupplierLocationModel.success == true) {
            setState(() {
              stockLoad = false;
            });
          } else {
            setState(() {
              stockLoad = false;
            });
            showToast("No Supplier for this location", context, color: false);
          }
          return true;
        }
        if (current is productModel.GetAddProductModel) {
          getAddProductModel = current;
          if (getAddProductModel.errorResponse?.isUnauthorized == true) {
            _handle401Error();
            return true;
          }
          if (getAddProductModel.success == true) {
            setState(() {
              stockLoad = false;
            });
          } else {
            setState(() {
              stockLoad = false;
            });
            showToast("No Product for this location", context, color: false);
          }
          return true;
        }
        if (current is SaveStockInModel) {
          saveStockInModel = current;
          if (saveStockInModel.errorResponse?.isUnauthorized == true) {
            _handle401Error();
            return true;
          }
          if (saveStockInModel.success == true) {
            debugPrint("Stock Save Successfully");
            showToast("Stock Save Successfully", context, color: true);
            Future.delayed(Duration(milliseconds: 100), () {
              clearStockInForm();
            });
            setState(() {
              saveLoad = false;
            });
          } else {
            setState(() {
              saveLoad = false;
            });
          }
          return true;
        }
        return false;
      }),
      builder: (context, dynamic) {
        return mainContainer();
      },
    );
  }

  void _handle401Error() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("token");
    await sharedPreferences.clear();
    showToast("Session expired. Please login again.", context, color: false);

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
