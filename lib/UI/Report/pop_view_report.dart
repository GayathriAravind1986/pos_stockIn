import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple/ModelClass/Order/Get_view_order_model.dart';
import 'package:simple/ModelClass/Report/Get_report_model.dart';
import 'package:simple/Reusable/color.dart';
import 'package:simple/Reusable/space.dart';
import 'package:simple/Reusable/text_styles.dart';
import 'package:simple/UI/Home_screen/Widget/another_imin_printer/imin_abstract.dart';
import 'package:simple/UI/Home_screen/Widget/another_imin_printer/mock_imin_printer_chrome.dart';
import 'package:simple/UI/Home_screen/Widget/another_imin_printer/real_device_printer.dart';
import 'package:simple/UI/IminHelper/Report_helper.dart';

class ThermalReportReceiptDialog extends StatefulWidget {
  final GetReportModel getReportModel;

  const ThermalReportReceiptDialog(this.getReportModel, {super.key});

  @override
  State<ThermalReportReceiptDialog> createState() =>
      _ThermalReportReceiptDialogState();
}

class _ThermalReportReceiptDialogState
    extends State<ThermalReportReceiptDialog> {
  late IPrinterService printerService;
  final GlobalKey reportKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      printerService = MockPrinterService();
    } else if (Platform.isAndroid) {
      printerService = RealPrinterService();
    } else {
      printerService = MockPrinterService();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String businessName = widget.getReportModel.businessName ?? 'Business Name';
    String userName = widget.getReportModel.userName ?? '';
    String address = widget.getReportModel.address ?? 'Business Address';
    String phone = widget.getReportModel.phone ?? '';
    double totalAmount = (widget.getReportModel.finalAmount ?? 0.0).toDouble();
    int totalQty = (widget.getReportModel.finalQty ?? 0.0).toInt();
    String date = DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now());

    return widget.getReportModel.data == null
        ? Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            alignment: Alignment.center,
            child: Text(
              "No Report found",
              style: MyTextStyle.f16(
                greyColor,
                weight: FontWeight.w500,
              ),
            ))
        : Dialog(
            backgroundColor: Colors.transparent,
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: const Text(
                            "Report",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Thermal Receipt Widget
                    RepaintBoundary(
                      key: reportKey,
                      child: getReportReceiptWidget(
                        businessName: businessName,
                        tamilTagline: "ஒரே ஒரு முறை சுவைத்து பாருங்கள்",
                        address: address,
                        phone: phone,
                        reportDate: date,
                        takenBy: userName,
                        totalQuantity: totalQty,
                        totalAmount: totalAmount,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            try {
                              await Future.delayed(
                                  const Duration(milliseconds: 300));
                              await WidgetsBinding.instance.endOfFrame;
                              Uint8List? imageBytes =
                                  await captureMonochromeReport(reportKey);

                              if (imageBytes != null) {
                                await printerService.init();
                                await printerService.printBitmap(imageBytes);
                                await Future.delayed(
                                    const Duration(seconds: 3));
                                await printerService.fullCut();
                                Navigator.pop(context);
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Print failed: $e")),
                              );
                            }
                          },
                          icon: const Icon(Icons.print),
                          label: const Text("Print"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenColor,
                            foregroundColor: whiteColor,
                          ),
                        ),
                        horizontalSpace(width: 10),
                        SizedBox(
                          width: size.width * 0.09,
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "CLOSE",
                              style: TextStyle(color: appPrimaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Close Button
                  ],
                ),
              ),
            ),
          );
  }
}
