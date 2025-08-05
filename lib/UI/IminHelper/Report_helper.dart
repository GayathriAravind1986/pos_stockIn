import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple/Reusable/color.dart';

Widget getReportReceiptWidget({
  required String businessName,
  required String tamilTagline,
  required String address,
  required String phone,
  required String reportDate,
  required String takenBy,
  required int totalQuantity,
  required double totalAmount,
}) {
  return Container(
    width: 384,
    color: whiteColor,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Center(
            child: Column(
              children: [
                Text(
                  tamilTagline,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  businessName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: 16,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Phone: $phone",
                  style: const TextStyle(
                    fontSize: 16,
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Separator
          Divider(thickness: 1, color: blackColor),

          // Report Title
          const Center(
            child: Text(
              "DAILY SALES REPORT",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: blackColor,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Report Details
          _buildThermalLabelRow("Report Date", reportDate),
          _buildThermalLabelRow("Taken By", takenBy),
          const SizedBox(height: 8),

          Divider(thickness: 1, color: blackColor),

          _buildThermalTotalRow("Total Quantity", totalQuantity.toDouble()),
          _buildThermalTotalRow(
            "Total Amount",
            totalAmount,
          ),

          Divider(thickness: 1, color: blackColor),

          const SizedBox(height: 8),
          const Center(
            child: Text(
              "Thank You!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: blackColor,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text(
              "Powered By",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: blackColor,
              ),
            ),
          ),
          const Center(
            child: Text(
              "www.sentinixtechsolutions.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: blackColor,
              ),
            ),
          ),
          const SizedBox(height: 80), // Footer padding
        ],
      ),
    ),
  );
}

Widget _buildThermalLabelRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: blackColor,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
        ),
      ],
    ),
  );
}

Widget _buildThermalTotalRow(String label, double amount,
    {bool isBold = false}) {
  final isAmountField = label.toLowerCase().contains("amount");
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 1.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: isBold
                ? 24
                : 20, // Larger for TOTAL, increased base from 12 to 14
            color: blackColor,
          ),
        ),
        Text(
          isAmountField
              ? '₹${amount.toStringAsFixed(2)}'
              : amount.toStringAsFixed(2),
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: isBold
                ? 24
                : 20, // Larger for TOTAL, increased base from 12 to 14
            color: blackColor,
          ),
        ),
      ],
    ),
  );
}

Future<Uint8List?> captureMonochromeReport(GlobalKey key) async {
  try {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;

    // Capture the widget as an image
    ui.Image image = await boundary.toImage(pixelRatio: 2.0);
    ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.rawRgba);

    if (byteData == null) return null;

    Uint8List pixels = byteData.buffer.asUint8List();
    int width = image.width;
    int height = image.height;

    // Convert to monochrome (black and white only)
    List<int> monochromePixels = [];

    for (int i = 0; i < pixels.length; i += 4) {
      int r = pixels[i];
      int g = pixels[i + 1];
      int b = pixels[i + 2];
      int a = pixels[i + 3];

      // Calculate luminance
      double luminance = (0.299 * r + 0.587 * g + 0.114 * b);

      // Convert to black or white based on threshold
      int value = luminance > 128 ? 255 : 0;

      monochromePixels.addAll([value, value, value, a]);
    }

    // Create new image from monochrome pixels
    ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(
        Uint8List.fromList(monochromePixels));

    ui.ImageDescriptor descriptor = ui.ImageDescriptor.raw(
      buffer,
      width: width,
      height: height,
      pixelFormat: ui.PixelFormat.rgba8888,
    );

    ui.Codec codec = await descriptor.instantiateCodec();
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    ui.Image monochromeImage = frameInfo.image;

    ByteData? finalByteData =
        await monochromeImage.toByteData(format: ui.ImageByteFormat.png);

    return finalByteData?.buffer.asUint8List();
  } catch (e) {
    print("Error creating monochrome image: $e");
    return null;
  }
}
